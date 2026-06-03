import 'package:llm_chatbot/features/iap/infrastructure/services/prod_purchase_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_service_provider.g.dart';

@riverpod
ProdPurchaseService purchaseService(Ref ref) {
  final service = ProdPurchaseService();

  //force it to be a permanent global singleton, coz it keep listening to app store event, so it should not be lazy load.
  ref.keepAlive();

  ref.onDispose(() {
    service.dispose();
  });

  return service;
}
