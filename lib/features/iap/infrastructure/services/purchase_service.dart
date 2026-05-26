import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  static const String premiumThemeId = 'premium_theme';

  void initialze() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = _iap.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _handlePurchaseUpdates,
      onDone: () => _subscription.cancel(),
      onError: (error) => debugPrint('⚠️ Purchase Stream Error: $error'),
    );
    debugPrint('🚀 Purchase Service Initialized & Listening...');
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchase in purchaseDetailsList) {
      debugPrint('📦 Processing purchase status: ${purchase.status}');

      if (purchase.status == PurchaseStatus.pending) {
        debugPrint(
          '⏳ Purchase is pending... waiting for platform authorization.',
        );
        continue;
      }

      if (purchase.status == PurchaseStatus.error) {
        debugPrint('❌ Purchase failed with error: ${purchase.error}');
      } else if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        debugPrint('🎉 SUCCESS! Item successfully processed.');
        debugPrint('🆔 Product ID: ${purchase.productID}');
        debugPrint('🔑 Transaction ID: ${purchase.transactionDate}');
      }

      //Close the transaction
      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> purchasePremiumTheme() async {
    final bool isStoreAvailable = await _iap.isAvailable();

    if (!isStoreAvailable) {
      throw Exception('In App Purchasing is unavailable on this device');
    }
    debugPrint('🔍 Querying product details for ID: $premiumThemeId...');

    final ProductDetailsResponse response = await _iap.queryProductDetails({
      premiumThemeId,
    });

    if (response.notFoundIDs.contains(premiumThemeId)) {
      throw Exception(
        '❌ Product ID "$premiumThemeId" not found by store engine.',
      );
    }

    if (response.productDetails.isNotEmpty) {
      final ProductDetails product = response.productDetails.first;
      final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: product,
      );

      await _iap.buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      throw Exception('❌ Product details array returned empty.');
    }
  }

  void dispose() {
    _subscription.cancel();
  }
}
