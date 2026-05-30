//Use this if the service need initialization
import 'package:llm_chatbot/features/auth/infrastructure/repositories/auth_repository.dart';

class AppStartupService {
  final AuthRepository _authRepository;

  AppStartupService(this._authRepository);

  //The call of this will not await, this is mean for non-blocking initialization, for blocking initialization, put in main()
  Future<void> initialize() async {
    await _authRepository.initialize();
  }
}
