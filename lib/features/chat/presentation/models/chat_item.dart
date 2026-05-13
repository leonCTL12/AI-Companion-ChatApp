//Just like abstract class in C# + all subtype must be defined in the same file
import '../../domain/models/message.dart';

sealed class ChatDisplayItem {}

class DateHeaderItem extends ChatDisplayItem {
  final DateTime date;

  DateHeaderItem(this.date);
}

class MessageItem extends ChatDisplayItem {
  final Message message;

  MessageItem(this.message);
}
