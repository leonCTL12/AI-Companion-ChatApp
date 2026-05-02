// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatRepository)
final chatRepositoryProvider = ChatRepositoryProvider._();

final class ChatRepositoryProvider
    extends
        $FunctionalProvider<IChatRepository, IChatRepository, IChatRepository>
    with $Provider<IChatRepository> {
  ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<IChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IChatRepository create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IChatRepository>(value),
    );
  }
}

String _$chatRepositoryHash() => r'524ada679f870affcfde450c468cda557d94b0dd';
