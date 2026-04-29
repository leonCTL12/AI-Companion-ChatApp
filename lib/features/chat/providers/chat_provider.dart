import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat_repository_provider.dart';

part 'chat_provider.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  Future<List<Message>> build() async {
    //initial state
    return [];
  }

  Future<void> addUserMessage(String content) async {
    final previousMessages = state.value ?? [];
    final newMessage = Message.user(content);
    final updatedListWithUser = [...previousMessages, newMessage];

    state = AsyncData(updatedListWithUser);

    //Loading but keep showing the old data!
    state = const AsyncLoading<List<Message>>().copyWithPrevious(state);

    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final response = await chatRepository.getChatResponse(
        updatedListWithUser,
      );

      state = AsyncData([...updatedListWithUser, response]);
    } catch (e, stack) {
      state = AsyncError<List<Message>>(
        e,
        stack,
      ).copyWithPrevious(AsyncData(updatedListWithUser));
    }
  }
}
