import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';

class LlmChatRepository implements IChatRepository {
  @override
  Future<Message> getChatResponse(List<Message> history) async {
    await Future.delayed(const Duration(seconds: 1));
    return Message.ai("TO BE IMPLEMENTED");
  }
}
