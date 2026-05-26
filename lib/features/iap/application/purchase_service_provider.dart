import 'package:llm_chatbot/features/iap/infrastructure/services/purchase_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_service_provider.g.dart';

@riverpod
PurchaseService purchaseService(Ref ref) {
  final service = PurchaseService();

  service.initialze();

  //force it to be a permanent global singleton, coz it keep listening to app store event, so it should not be lazy load.
  ref.keepAlive();

  ref.onDispose(() {
    service.dispose();
  });

  return service;
}
