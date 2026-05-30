import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:llm_chatbot/features/auth/infrastructure/services/google_sign_in_service.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignInService _googleService;

  AuthRepository(this._googleService);

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> initialize() async {
    final user = _auth.currentUser;
    if (user == null) {
      print(
        '🤖 [Pure Core Engine] No session found. Executing guest sign-in...',
      );
      try {
        await signInAnonymously();
        print('🤖 [Pure Core Engine] Guest sign-in completed successfully.');
      } catch (e) {
        print('🤖 [Pure Core Engine] Critical background auth failure: $e');
        // Handle or log error without UI/Framework dependencies
      }
    } else {
      print(
        '🤖 [Pure Core Engine] Existing session restored for UID: ${user.uid}',
      );
    }
  }

  Future<UserCredential?> signInAnonymously() async {
    try {
      debugPrint('🔐 Attempting Firebase Anonymous Sign-In...');
      return await _auth.signInAnonymously();
    } catch (e) {
      debugPrint('❌ Anonymous Sign-In Failure: $e');
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final tokens = await _googleService.getTokens();
      if (tokens == null) return null;

      final credential = GoogleAuthProvider.credential(
        idToken: tokens.idToken,
        accessToken: tokens.accessToken,
      );

      final user = _auth.currentUser;

      //If user is anonymous user, upgrade them seamlessly
      if (user != null && user.isAnonymous) {
        debugPrint(
          '🔄 Upgrading anonymous session ${user.uid} to permanent Google account...',
        );
        return await user.linkWithCredential(credential);
      }

      //Standard sign in
      debugPrint('🔑 Executing standard fresh Google Sign-In...');
      return await _auth.signInWithCredential(credential);
    } on FirebaseException catch (e) {
      if (e.code == 'credential-already-in-use') {
        debugPrint('⚠️ This Google account is already linked to another user.');
        final anonymousUser = _auth.currentUser;
        //Discard the anonymous user and sign in normally
        if (anonymousUser != null && anonymousUser.isAnonymous) {
          try {
            await anonymousUser.delete();
            debugPrint(
              '🗑️ Successfully deleted abandoned anonymous user ${anonymousUser.uid}',
            );
          } catch (e) {
            debugPrint('⚠️ Failed to clean up anonymous user: $e');
          }
        }

        //This is an edge case when a user already has a google account but still created an anonymous account and then signin
        final altTokens = await _googleService.getTokens();
        if (altTokens == null) return null;

        final altCredential = GoogleAuthProvider.credential(
          idToken: altTokens.idToken,
          accessToken: altTokens.accessToken,
        );
        return await _auth.signInWithCredential(altCredential);
      }
      rethrow;
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
