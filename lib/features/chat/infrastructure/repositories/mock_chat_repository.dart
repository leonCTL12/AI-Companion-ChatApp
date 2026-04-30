import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';

class MockChatRepository implements IChatRepository {
  @override
  Future<Message> getChatResponse(List<Message> history) async {
    await Future.delayed(const Duration(seconds: 3));
    return Message.ai("Thanks for asking! This s a mock response!");
  }
}
