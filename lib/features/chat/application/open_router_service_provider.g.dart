// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_router_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(openRouterService)
final openRouterServiceProvider = OpenRouterServiceProvider._();

final class OpenRouterServiceProvider
    extends
        $FunctionalProvider<
          OpenRouterService,
          OpenRouterService,
          OpenRouterService
        >
    with $Provider<OpenRouterService> {
  OpenRouterServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openRouterServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openRouterServiceHash();

  @$internal
  @override
  $ProviderElement<OpenRouterService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpenRouterService create(Ref ref) {
    return openRouterService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenRouterService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenRouterService>(value),
    );
  }
}

String _$openRouterServiceHash() => r'cc64f0c1d2ef8dcfb87523047788c9041f2e2f40';
