import 'dart:convert';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';

import '../../domain/models/message.dart' as domain;

class FirebaseChatService {
  final _functions = FirebaseFunctions.instanceFor(region: 'asia-east2');
  static const String _imagePrompt =
      "Acknowledge this image as a friend would.";

  FirebaseChatService() {
    const bool useEmulator = bool.fromEnvironment(
      'USE_EMULATOR',
      defaultValue: false,
    );
    if (useEmulator) {
      try {
        final host = 'localhost';
        _functions.useFunctionsEmulator(host, 5001);
        print("Connected to Firebase Emulator at $host:5001");
      } catch (e) {
        print("Error connecting to emulator: $e");
      }
    }
  }

  Future<String> getChatResponse(List<domain.Message> history) async {
    try {
      final callable = _functions.httpsCallable('getChatResponse');
      final List<Map<String, dynamic>> processedHistory =
          await _transformHistory(history);
      final result = await callable.call({'history': processedHistory});

      return result.data['message'] as String;
    } on FirebaseFunctionsException catch (e) {
      return "Firebase Error: [${e.code}] ${e.message}";
    } catch (e) {
      return "Unexpected Error: $e";
    }
  }

  Future<List<Map<String, dynamic>>> _transformHistory(
    List<domain.Message> history,
  ) async {
    List<Map<String, dynamic>> result = [];
    for (var message in history) {
      String? encodedImage;

      if (message.imageUrl != null) {
        final file = File(message.imageUrl!);

        if (await file.exists()) {
          final bytes = await file.readAsBytes();
          encodedImage = "data:image/jpeg;base64,${base64Encode(bytes)}";
        }
      }

      final content = (message.content.trim().isEmpty && encodedImage != null)
          ? _imagePrompt
          : message.content;

      result.add({
        'content': content,
        'fromUser': message.fromUser,
        'encodedImage': encodedImage,
      });
    }

    return result;
  }
}
