import 'package:llm_chatbot/core/infrastructure/app_startup_service.dart';
import 'package:llm_chatbot/features/auth/application/auth_repository_provider.dart';
import 'package:llm_chatbot/features/iap/application/purchase_service_provider.dart';
import 'package:llm_chatbot/features/iap/application/token_fulfillment_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_service_provider.g.dart';

@riverpod
AppStartupService appStartupService(Ref ref) {
  //Keep this in memory even if no UI listens to it
  ref.keepAlive();

  final authRepository = ref.watch(authRepositoryProvider);
  final tokenFulfillmentService = ref.watch(tokenFulfillmentServiceProvider);
  final purchaseService = ref.watch(purchaseServiceProvider);

  final service = AppStartupService(
    authRepository,
    tokenFulfillmentService,
    purchaseService,
  );
  service.initialize();
  return service;
}
