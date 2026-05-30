import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:llm_chatbot/features/auth/application/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

//Use this only if you need the User object meta data like UID, if you just wanna know if the user sign-in or not use isPermanentUserProvider
@riverpod
Stream<User?> authState(Ref ref) {
  final authRepo = ref.watch(authRepositoryProvider);

  return authRepo.authStateChanges();
}
