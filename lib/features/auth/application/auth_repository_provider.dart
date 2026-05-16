import 'package:llm_chatbot/features/auth/application/google_sign_in_service_provider.dart';
import 'package:llm_chatbot/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final googleService = ref.watch(googleSignInServiceProvider);
  return AuthRepository(googleService);
}
