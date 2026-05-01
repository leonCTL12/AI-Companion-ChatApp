import 'package:llm_chatbot/features/chat/infrastructure/services/open_router_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_router_service_provider.g.dart';

@riverpod
OpenRouterService openRouterService(Ref ref) {
  return OpenRouterService();
}
