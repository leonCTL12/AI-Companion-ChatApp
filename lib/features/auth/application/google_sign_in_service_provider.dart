import 'package:llm_chatbot/features/auth/infrastructure/services/google_sign_in_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_sign_in_service_provider.g.dart';

@riverpod
GoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInService();
}
