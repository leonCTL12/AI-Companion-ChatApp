//Use this if the service need initialization
import 'package:llm_chatbot/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:llm_chatbot/features/iap/infrastructure/services/token_fulfillment_service.dart';

class AppStartupService {
  final AuthRepository _authRepository;
  final TokenFulfillmentService _tokenFulfillmentService;

  AppStartupService(this._authRepository, this._tokenFulfillmentService);

  //The call of this will not await, this is mean for non-blocking initialization, for blocking initialization, put in main()
  Future<void> initialize() async {
    _tokenFulfillmentService.initialize();
    await _authRepository.initialize();
  }
}
