import 'package:llm_chatbot/features/chat/application/open_router_service_provider.dart';
import 'package:llm_chatbot/features/chat/infrastructure/repositories/llm_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/repositories/i_chat_repository.dart';
import '../infrastructure/repositories/mock_chat_repository.dart';

part 'chat_repository_provider.g.dart';

@riverpod
IChatRepository chatRepository(Ref ref) {
  final service = ref.watch(openRouterServiceProvider);
  return LlmChatRepository(service);
}
