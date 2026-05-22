import 'package:llm_chatbot/features/ad/application/ad_service_provider.dart';
import 'package:llm_chatbot/features/chat/infrastructure/repositories/llm_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/repositories/i_chat_repository.dart';
import 'firebase_chat_service_provider.dart';

part 'chat_repository_provider.g.dart';

@riverpod
IChatRepository chatRepository(Ref ref) {
  final firebaseService = ref.watch(firebaseChatServiceProvider);
  final adService = ref.watch(adServiceProvider);
  return LlmChatRepository(firebaseService, adService);
}
