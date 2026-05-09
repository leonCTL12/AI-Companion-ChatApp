class Message {
  final bool fromUser;
  final String content;
  final DateTime timestamp;
  final String? imageUrl;

  Message._({
    required this.content,
    required this.fromUser,
    required this.timestamp,
    this.imageUrl,
  });

  Message.user(String content, {String? imageUrl})
    : this._(
        content: content,
        fromUser: true,
        timestamp: DateTime.now(),
        imageUrl: imageUrl,
      );

  Message.ai(String content)
    : this._(content: content, fromUser: false, timestamp: DateTime.now());
}
