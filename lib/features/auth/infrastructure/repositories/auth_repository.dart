import 'package:firebase_auth/firebase_auth.dart';
import 'package:llm_chatbot/features/auth/infrastructure/services/google_sign_in_service.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignInService _googleService;

  AuthRepository(this._googleService);

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final tokens = await _googleService.getTokens();
      if (tokens == null) return null;

      final credential = GoogleAuthProvider.credential(
        idToken: tokens.idToken,
        accessToken: tokens.accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      //run in parallel
      await Future.wait([_auth.signOut(), _googleService.signOut()]);
    } catch (e) {
      rethrow;
    }
  }
}
