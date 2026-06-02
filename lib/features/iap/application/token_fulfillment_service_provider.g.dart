// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_fulfillment_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenFulfillmentService)
final tokenFulfillmentServiceProvider = TokenFulfillmentServiceProvider._();

final class TokenFulfillmentServiceProvider
    extends
        $FunctionalProvider<
          TokenFulfillmentService,
          TokenFulfillmentService,
          TokenFulfillmentService
        >
    with $Provider<TokenFulfillmentService> {
  TokenFulfillmentServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenFulfillmentServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenFulfillmentServiceHash();

  @$internal
  @override
  $ProviderElement<TokenFulfillmentService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TokenFulfillmentService create(Ref ref) {
    return tokenFulfillmentService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenFulfillmentService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenFulfillmentService>(value),
    );
  }
}

String _$tokenFulfillmentServiceHash() =>
    r'984cc5e9efb5fa7c988c41ae02aa274d1a33b805';
