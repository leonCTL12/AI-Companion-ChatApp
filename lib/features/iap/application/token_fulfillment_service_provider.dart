import 'package:llm_chatbot/features/iap/application/purchase_service_provider.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/token_fulfillment_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/application/auth_repository_provider.dart';

part 'token_fulfillment_service_provider.g.dart';

@riverpod
TokenFulfillmentService tokenFulfillmentService(Ref ref) {
  final purchaseService = ref.watch(purchaseServiceProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  //Transform Stream<User?> to Stream<String?>
  final uidStream = authRepository
      .authStateChanges()
      .map((user) => user?.uid)
      .distinct();

  final service = TokenFulfillmentService(
    purchaseService.onTokensPurchased,
    uidStream,
  );

  ref.keepAlive();
  ref.onDispose(() {
    service.dispose();
  });

  return service;
}
