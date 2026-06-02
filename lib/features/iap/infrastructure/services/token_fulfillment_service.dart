import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

class TokenFulfillmentService {
  final Stream<int> _purchaseStream;
  final Stream<String?> _uidStream;

  String? _currentUid;

  StreamSubscription<int>? _purchaseSubscription;
  StreamSubscription<String?>? _uidSubscription;

  TokenFulfillmentService(this._purchaseStream, this._uidStream);

  void initialize() {
    _uidSubscription = _uidStream.listen((uid) {
      _currentUid = uid;
      debugPrint('👤 [IAP] Context shifted. Target user is now: $uid');
    }, onError: (error) => debugPrint('❌ [IAP] User Stream Error: $error'));

    _purchaseSubscription = _purchaseStream.listen(
      _fulfillTokensOnBackend,
      onError: (error) => debugPrint('❌ [IAP] Stream Error: $error'),
    );
  }

  Future<void> _fulfillTokensOnBackend(int tokens) async {
    try {
      debugPrint(
        '🔄 [IAP] Initiating token top-up for UID: $_currentUid (+ $tokens tokens)...',
      );
      await FirebaseFunctions.instance.httpsCallable('addTokensToUser').call({
        'uid': _currentUid,
        'token': tokens,
      });
      debugPrint('✅ [IAP] Successfully credited $tokens tokens to user.');
    } on FirebaseFunctionsException catch (e) {
      debugPrint('❌ [IAP] Cloud Function Failed: [${e.code}] - ${e.message}');
    } catch (e) {
      debugPrint('❌ [IAP] Unexpected Fulfillment Error: $e');
    }
  }

  void dispose() {
    _purchaseSubscription?.cancel();
    _uidSubscription?.cancel();
    debugPrint('🛑 [IAP] TokenFulfillmentService closed for UID: $_currentUid');
  }
}
