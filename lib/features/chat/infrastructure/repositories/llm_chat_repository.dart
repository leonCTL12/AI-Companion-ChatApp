import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/firebase_chat_service.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/open_router_service.dart';

class LlmChatRepository implements IChatRepository {
  final OpenRouterService _openRouterService;
  final FirebaseChatService _firebaseChatService;

  LlmChatRepository(this._openRouterService, this._firebaseChatService);

  @override
  Future<Message> getChatResponse(List<Message> history) async {
    // final response = await _openRouterService.getChatResponse(history);
    final response = await _firebaseChatService.getChatResponse(history);
    return Message.ai(response);
  }
}
