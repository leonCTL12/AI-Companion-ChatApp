import 'package:llm_chatbot/features/chat/infrastructure/services/firebase_chat_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_chat_service_provider.g.dart';

@riverpod
FirebaseChatService firebaseChatService(Ref ref) {
  return FirebaseChatService();
}
