import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../domain/models/message.dart';

class BaseChatMessageBubble extends StatelessWidget {
  final Message message;
  final Alignment alignment;
  final Color backgroundColor;
  final Color textColor;

  const BaseChatMessageBubble({
    super.key,
    required this.message,
    required this.alignment,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Align(
      alignment: alignment,

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.content,
              style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat.jm().format(message.timestamp),
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withAlpha(
                  153,
                ), //i.e. 60% opacity
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
