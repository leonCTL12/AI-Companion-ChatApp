import 'dart:convert';

import 'package:llm_chatbot/features/backup/infrastructure/services/cloud_storage_service.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/local_db_service.dart';

import '../../../chat/domain/models/message.dart';

class BackupRepository {
  final LocalDbService _localDbService;
  final CloudStorageService _cloudStorageService;
  static const String payloadField = 'payload';
  static const String checksumField = 'checksum';

  BackupRepository(this._localDbService, this._cloudStorageService);

  Future<void> executeBackup(String userId) async {
    try {
      final messages = await _localDbService.getHistory();
      if (messages.isEmpty) return;
      final List<Map<String, dynamic>> rawMaps = messages
          .map((m) => m.toMap())
          .toList();
      final String rawJson = jsonEncode(rawMaps);
      final Map<String, dynamic> payload = {
        payloadField: rawJson,
        checksumField: rawMaps.length, //message count
      };

      await _cloudStorageService.uploadBackup(
        userId: userId,
        encryptedPayload: payload,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> restoreBackup(String userId) async {
    try {
      final backupData = await _cloudStorageService.downloadBackup(userId);

      if (backupData == null || !backupData.containsKey(payloadField)) {
        throw Exception('No backup found for this user account.');
      }

      final String rawJson = backupData[payloadField] as String;

      final List<dynamic> decodedMaps = jsonDecode(rawJson) as List<dynamic>;

      final List<Message> restoredMessages = decodedMaps.map((map) {
        return Message.fromMap(map as Map<String, dynamic>);
      }).toList();

      await _localDbService.replaceHistory(restoredMessages);
    } catch (e) {
      rethrow;
    }
  }
}
