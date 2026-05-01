import 'package:dio/dio.dart';
import 'package:llm_chatbot/core/constants/llm_const.dart';
import '../../domain/models/message.dart' as domain;
import 'dart:developer' as dev;

class OpenRouterService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://openrouter.ai/api/v1",
      headers: {
        'Authorization': 'Bearer ${LlmConst.apiKey}',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<String> getChatResponse(List<domain.Message> history) async {
    final List<Map<String, dynamic>> messages = [
      {"role": "system", "content": LlmConst.systemPrompt},
      ...history.map(
        (m) => {
          "role": m.fromUser ? "user" : "assistant",
          "content": m.content,
        },
      ),
    ];

    try {
      final response = await _dio.post(
        '/chat/completions',
        data: {
          "model": LlmConst.model,
          "messages": messages,
          "temperature": 0.8,
        },
      );

      final choices = response.data['choices'] as List;
      if (choices.isNotEmpty) {
        // Use .first as a cleaner way of saying [0]
        return choices.first['message']['content'] as String;
      } else {
        throw Exception('OpenRouter returned an empty choice list');
      }
    } on DioException catch (e) {
      // PRO TIP: This will tell you exactly what OpenRouter is complaining about
      dev.log("OpenRouter Error Body: ${e.response?.data}");
      rethrow;
    }
  }
}
