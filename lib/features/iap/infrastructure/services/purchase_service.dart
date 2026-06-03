abstract class PurchaseService {
  void initialize();

  Future<void> purchaseTokenPack();

  Stream<int> get onTokensPurchased;

  void dispose();
}
