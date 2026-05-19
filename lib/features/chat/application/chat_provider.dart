import 'package:llm_chatbot/features/chat/application/image_util_service_provider.dart';
import 'package:llm_chatbot/features/chat/application/local_db_service_provider.dart';
import 'package:llm_chatbot/features/chat/domain/models/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat_repository_provider.dart';

part 'chat_provider.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  Future<List<Message>> build() async {
    final localDb = ref.read(localDbServiceProvider);
    return await localDb.getHistory();
  }

  Future<void> addUserMessage(String content, {String? imagePath}) async {
    final imageUtilService = ref.read(imageUtilServiceProvider);
    final localDb = ref.read(localDbServiceProvider);

    if (imagePath != null) {
      imagePath = await imageUtilService.moveImageToAppDir(imagePath);
    }

    final previousMessages = state.value ?? [];

    final newMessage = Message.user(content, imageUrl: imagePath);

    await localDb.saveMessage(newMessage);

    final updatedListWithUser = [...previousMessages, newMessage];

    state = AsyncData(updatedListWithUser);

    //Loading but keep showing the old data!
    //Riverpod will keep the previous data even if you switch from async data to async loading
    state = const AsyncLoading<List<Message>>();

    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final response = await chatRepository.getChatResponse(
        updatedListWithUser,
      );

      await localDb.saveMessage(response);

      state = AsyncData([...updatedListWithUser, response]);
    } catch (e, stack) {
      state = AsyncError<List<Message>>(e, stack);
    }
  }

  Future<void> reloadFromLocalDb() async {
    state = const AsyncLoading<List<Message>>();
    try {
      final localDb = ref.read(localDbServiceProvider);
      final history = await localDb.getHistory();
      state = AsyncData(history);
    } catch (e, stack) {
      state = AsyncError<List<Message>>(e, stack);
    }
  }
}
