import 'package:llm_chatbot/features/ad/infrastructure/services/ad_service.dart';
import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/firebase_chat_service.dart';

class LlmChatRepository implements IChatRepository {
  final FirebaseChatService _firebaseChatService;
  final AdService _adService;

  LlmChatRepository(this._firebaseChatService, this._adService);

  @override
  Future<Message> getChatResponse(List<Message> history) async {
    _adService.showTestInterstitial();
    final response = await _firebaseChatService.getChatResponse(history);
    return Message.ai(response);
  }
}
