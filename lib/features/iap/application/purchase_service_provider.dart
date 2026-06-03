import 'package:flutter/foundation.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/mock_purchase_service.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/prod_purchase_service.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/purchase_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_service_provider.g.dart';

@riverpod
PurchaseService purchaseService(Ref ref) {
  //Because android requires tons of set up (and a google play console account) to test IAP, so I just mock it here
  final service = defaultTargetPlatform == TargetPlatform.android
      ? MockPurchaseService()
      : ProdPurchaseService();

  //force it to be a permanent global singleton, coz it keep listening to app store event, so it should not be lazy load.
  ref.keepAlive();

  ref.onDispose(() {
    service.dispose();
  });

  return service;
}
