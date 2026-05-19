import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInittialized = false;

  Future<void> _ensureInitialized() async {
    if (!_isInittialized) {
      await _googleSignIn.initialize();
      _isInittialized = true;
    }
  }

  Future<({String? idToken, String? accessToken})?> getTokens() async {
    try {
      await _ensureInitialized();
      final googleUser = await _googleSignIn.authenticate();

      final clientAuth = await googleUser.authorizationClient.authorizeScopes([
        'email',
        'profile',
      ]);
      return (
        idToken: googleUser.authentication.idToken,
        accessToken: clientAuth.accessToken,
      );
    } on GoogleSignInException catch (e) {
      // Return null if user cancels (standard UX pattern)
      print('Google Auth Error: ${e.code}');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _ensureInitialized();

      await _googleSignIn.signOut();
    } catch (e) {
      print('Error signing out of Google: $e');
    }
  }
}
