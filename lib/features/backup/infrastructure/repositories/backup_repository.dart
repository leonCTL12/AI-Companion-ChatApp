import 'dart:convert';

import 'package:llm_chatbot/features/backup/infrastructure/services/cloud_storage_service.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/local_db_service.dart';

class BackupRepository {
  final LocalDbService _localDbService;
  final CloudStorageService _cloudStorageService;

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
        'payload': rawJson,
        'checksum': rawMaps.length, //message count
      };

      await _cloudStorageService.uploadBackup(
        userId: userId,
        encryptedPayload: payload,
      );
    } catch (e) {
      rethrow;
    }
  }
}
