import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/purchase_service.dart';

class MockPurchaseService implements PurchaseService {
  final StreamController<int> _tokenPurchaseController =
      StreamController<int>.broadcast();

  @override
  void initialize() {
    debugPrint(
      '🧪 Mock Purchase Service Initialized (Android Development Mode)...',
    );
  }

  @override
  // TODO: implement onTokensPurchased
  Stream<int> get onTokensPurchased => _tokenPurchaseController.stream;

  @override
  Future<void> purchaseTokenPack() async {
    debugPrint('⏳ [MOCK] Simulating Android Google Play payment sheet...');
    await Future.delayed(const Duration(milliseconds: 800));

    _tokenPurchaseController.add(2);
    debugPrint('✅ [MOCK] 2 Tokens broadcasted to stream.');
  }

  @override
  void dispose() {
    _tokenPurchaseController.close();
  }
}
