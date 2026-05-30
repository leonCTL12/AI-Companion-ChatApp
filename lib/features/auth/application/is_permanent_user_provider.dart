import 'package:llm_chatbot/features/auth/application/auth_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_permanent_user_provider.g.dart';

@riverpod
bool isPermanentUser(Ref ref) {
  final authStateAsync = ref.watch(authStateProvider);

  final user = authStateAsync.value;

  if (user == null || user.isAnonymous) {
    return false;
  }

  return true;
}
