// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProvinceNotifier)
const provinceProvider = ProvinceNotifierProvider._();

final class ProvinceNotifierProvider
    extends $AsyncNotifierProvider<ProvinceNotifier, List<ProvinceResponse>> {
  const ProvinceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'provinceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$provinceNotifierHash();

  @$internal
  @override
  ProvinceNotifier create() => ProvinceNotifier();
}

String _$provinceNotifierHash() => r'0f300562f165d4621807fcada0c03e9c2b3a3275';

abstract class _$ProvinceNotifier
    extends $AsyncNotifier<List<ProvinceResponse>> {
  FutureOr<List<ProvinceResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ProvinceResponse>>, List<ProvinceResponse>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProvinceResponse>>,
                List<ProvinceResponse>
              >,
              AsyncValue<List<ProvinceResponse>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
