import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/widgets/sign_in_modal.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showSignInModal(context),
      child: Text('Sign in'),
    );
  }

  void _showSignInModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SignInModal(),
      barrierDismissible: false,
    );
  }
}
