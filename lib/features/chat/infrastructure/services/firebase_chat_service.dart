import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/message.dart' as domain;

class FirebaseChatService {
  final _functions = FirebaseFunctions.instanceFor(region: 'asia-east2');

  FirebaseChatService() {
    if (kDebugMode) {
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
      final callable = _functions.httpsCallable('helloWorld');

      final result = await callable.call({'name': "Leon"});

      return result.data['message'] as String;
    } on FirebaseFunctionsException catch (e) {
      return "Firebase Error: [${e.code}] ${e.message}";
    } catch (e) {
      return "Unexpected Error: $e";
    }
  }
}
