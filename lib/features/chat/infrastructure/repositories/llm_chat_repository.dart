import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/open_router_service.dart';

class LlmChatRepository implements IChatRepository {
  final OpenRouterService _openRouterService;

  LlmChatRepository(this._openRouterService);

  @override
  Future<Message> getChatResponse(List<Message> history) async {
    final response = await _openRouterService.getChatResponse(history);
    return Message.ai(response);
  }
}
