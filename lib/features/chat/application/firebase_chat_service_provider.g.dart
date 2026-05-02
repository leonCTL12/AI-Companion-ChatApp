// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_chat_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firebaseChatService)
final firebaseChatServiceProvider = FirebaseChatServiceProvider._();

final class FirebaseChatServiceProvider
    extends
        $FunctionalProvider<
          FirebaseChatService,
          FirebaseChatService,
          FirebaseChatService
        >
    with $Provider<FirebaseChatService> {
  FirebaseChatServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseChatServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseChatServiceHash();

  @$internal
  @override
  $ProviderElement<FirebaseChatService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseChatService create(Ref ref) {
    return firebaseChatService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseChatService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseChatService>(value),
    );
  }
}

String _$firebaseChatServiceHash() =>
    r'ffb651bb06d146cbb966b4e5053ddb32da48da5a';
