import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/auth/application/auth_state_provider.dart';
import 'package:llm_chatbot/features/auth/application/is_permanent_user_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/sign_in_button.dart';
import 'package:llm_chatbot/features/chat/presentation/widgets/sign_out_button.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPermanentUser = ref.watch(isPermanentUserProvider);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        if (isPermanentUser) const SignOutButton() else const SignInButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //default height of material app bar
}
