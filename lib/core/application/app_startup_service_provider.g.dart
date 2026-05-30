// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appStartupService)
final appStartupServiceProvider = AppStartupServiceProvider._();

final class AppStartupServiceProvider
    extends
        $FunctionalProvider<
          AppStartupService,
          AppStartupService,
          AppStartupService
        >
    with $Provider<AppStartupService> {
  AppStartupServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStartupServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStartupServiceHash();

  @$internal
  @override
  $ProviderElement<AppStartupService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppStartupService create(Ref ref) {
    return appStartupService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStartupService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStartupService>(value),
    );
  }
}

String _$appStartupServiceHash() => r'8ebd0d65429aa7a71a57c5c2de2977545d89de64';
