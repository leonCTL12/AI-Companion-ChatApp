// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_display_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatDisplayItems)
final chatDisplayItemsProvider = ChatDisplayItemsProvider._();

final class ChatDisplayItemsProvider
    extends
        $FunctionalProvider<
          List<ChatDisplayItem>,
          List<ChatDisplayItem>,
          List<ChatDisplayItem>
        >
    with $Provider<List<ChatDisplayItem>> {
  ChatDisplayItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatDisplayItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatDisplayItemsHash();

  @$internal
  @override
  $ProviderElement<List<ChatDisplayItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ChatDisplayItem> create(Ref ref) {
    return chatDisplayItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ChatDisplayItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ChatDisplayItem>>(value),
    );
  }
}

String _$chatDisplayItemsHash() => r'7dd200746e864f96636ac61c9650598f85028455';
