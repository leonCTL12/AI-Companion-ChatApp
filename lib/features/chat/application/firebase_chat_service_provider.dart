import 'package:llm_chatbot/features/chat/application/image_util_service_provider.dart';
import 'package:llm_chatbot/features/chat/infrastructure/services/firebase_chat_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_chat_service_provider.g.dart';

@riverpod
FirebaseChatService firebaseChatService(Ref ref) {
  var imageUtilService = ref.watch(imageUtilServiceProvider);
  return FirebaseChatService(imageUtilService);
}
