import 'package:llm_chatbot/features/chat/application/chat_provider.dart';
import 'package:llm_chatbot/features/chat/presentation/models/chat_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_display_item_provider.g.dart';

@riverpod
List<ChatDisplayItem> chatDisplayItems(Ref ref) {
  final messagesAsync = ref.watch(chatProvider);

  return messagesAsync.maybeWhen(
    data: (messages) {
      if (messages.isEmpty) return [];

      final List<ChatDisplayItem> displayItems = [];
      for (int i = 0; i < messages.length; i++) {
        final currentMsg = messages[i];
        if (i == 0 ||
            !_isSameDay(currentMsg.timestamp, messages[i - 1].timestamp)) {
          displayItems.add(DateHeaderItem(currentMsg.timestamp));
        }
        displayItems.add(MessageItem(currentMsg));
      }
      return displayItems;
    },
    orElse: () => [],
  );
}

bool _isSameDay(DateTime d1, DateTime d2) {
  return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
}
