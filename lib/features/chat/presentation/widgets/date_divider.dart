import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDivider extends StatelessWidget {
  final DateTime dateTime;

  const DateDivider({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          // Using surfaceVariant for a subtle, modern background
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withAlpha(204), //80% opacity
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _formatDate(dateTime),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final comparisonDate = DateTime(date.year, date.month, date.day);

    if (comparisonDate == today) return "Today";
    if (comparisonDate == yesterday) return "Yesterday";
    return DateFormat.yMMMd().format(date);
  }
}
