class Message {
  final bool fromUser;
  final String content;
  final DateTime timestamp;

  Message._({
    required this.content,
    required this.fromUser,
    required this.timestamp,
  });

  Message.user(String content)
    : this._(content: content, fromUser: true, timestamp: DateTime.now());

  Message.ai(String content)
    : this._(content: content, fromUser: false, timestamp: DateTime.now());
}
