import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_chatbot/features/iap/application/purchase_service_provider.dart';

class PurchaseButton extends ConsumerWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          onPressed: () async {
            await ref.read(purchaseServiceProvider).purchasePremiumTheme();
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          label: const Text('Purchase!!!'),
          icon: const Icon(Icons.money_rounded),
        ),
      ),
    );
  }
}
