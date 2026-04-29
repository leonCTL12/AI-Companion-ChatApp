import '../models/message.dart';

abstract class IChatRepository {
  Future<Message> getChatResponse(List<Message> history);
}
