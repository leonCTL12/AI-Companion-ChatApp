import 'package:llm_chatbot/core/constants/llm_const.dart';
import 'package:openrouter/openrouter.dart';
import '../../domain/models/message.dart' as domain;

class OpenRouterService {
  final _client = OpenRouterClient(apiKey: LlmConst.apiKey);

  Future<String> getChatResponse(List<domain.Message> history) async {
    final List<Message> apiMessages = [
      Message.system(LlmConst.systemPrompt),

      ...history.map((m) {
        if (m.fromUser) {
          return Message.user(m.content);
        } else {
          return Message.assistant(m.content);
        }
      }),
    ];

    final response = await _client.chatCompletion(
      ChatRequest(
        model: LlmConst.model,
        messages: apiMessages,
        temperature: 0.8,
      ),
    );

    return response.content ?? '';
  }
}
