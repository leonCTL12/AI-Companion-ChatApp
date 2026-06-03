//Use this if the service need initialization
import 'package:llm_chatbot/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/prod_purchase_service.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/token_fulfillment_service.dart';

class AppStartupService {
  final AuthRepository _authRepository;
  final TokenFulfillmentService _tokenFulfillmentService;
  final ProdPurchaseService _purchaseService;

  AppStartupService(
    this._authRepository,
    this._tokenFulfillmentService,
    this._purchaseService,
  );

  //The call of this will not await, this is mean for non-blocking initialization, for blocking initialization, put in main()
  Future<void> initialize() async {
    _tokenFulfillmentService.initialize();
    await _authRepository.initialize();
    _purchaseService.initialize();
  }
}
