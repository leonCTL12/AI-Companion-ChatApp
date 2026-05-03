import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/firebase_chat_service.dart';

class LlmChatRepository implements IChatRepository {
  final FirebaseChatService _firebaseChatService;

  LlmChatRepository(this._firebaseChatService);

  @override
  Future<Message> getChatResponse(List<Message> history) async {
    final response = await _firebaseChatService.getChatResponse(history);
    return Message.ai(response);
  }
}
