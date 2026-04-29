import 'package:llm_chatbot/features/chat/data/repositories/mock_chat_repository.dart';
import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:llm_chatbot/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat_repository_provider.dart';

part 'chat_provider.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  List<Message> build() {
    //initial state
    return [
      Message.user("K"),

      Message.ai("I'm here for you.\n\n Let's take a deep breath together."),

      Message.user(
        "This is a really long sentence intended to see how the bubble expands horizontally until it hits the maximum width constraint, at which point it should ideally wrap to a new line instead of overflowing the screen edges or stretching the bubble awkwardly across the entire width of a tablet screen.",
      ),

      Message.ai("That sounds wonderful! 🚀✨🌈🥳🙌"),

      Message.user("👍"),

      Message.ai(
        "Check this out: https://www.thisisaverylongurlthatmightbreakthelayoutifnotmanagedcorrectly.com/flutter-dev-diary-emotional-support-ai",
      ),

      Message.user("Wait..."),
      Message.ai(
        "I'm listening... go on... I have all the time in the world for you.",
      ),

      Message.user("How does it look?     \n(Checking spacing)     "),
      Message.ai(";)"),
    ];
  }

  Future<void> addUserMessage(String content) async {
    final newMessage = Message.user(content);
    state = [...state, newMessage];
    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final response = await chatRepository.getChatResponse(state);
      state = [...state, response];
    } catch (e) {
      state = [
        ...state,
        Message.ai("Sorry, some issues exists please try again later"),
      ];
    }
  }
}
