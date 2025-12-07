// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_generater_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeGeneraterNotifier)
const homeGeneraterProvider = HomeGeneraterNotifierProvider._();

final class HomeGeneraterNotifierProvider
    extends $NotifierProvider<HomeGeneraterNotifier, int> {
  const HomeGeneraterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeGeneraterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeGeneraterNotifierHash();

  @$internal
  @override
  HomeGeneraterNotifier create() => HomeGeneraterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$homeGeneraterNotifierHash() =>
    r'd4da919c9a2c4330c2f82618f4b744991a1c6f74';

abstract class _$HomeGeneraterNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
