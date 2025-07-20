// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$domainByIdHash() => r'44e48c105614badb66659c4d1872ca1613100f8d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [domainById].
@ProviderFor(domainById)
const domainByIdProvider = DomainByIdFamily();

/// See also [domainById].
class DomainByIdFamily extends Family<AsyncValue<Domain>> {
  /// See also [domainById].
  const DomainByIdFamily();

  /// See also [domainById].
  DomainByIdProvider call(
    int id,
  ) {
    return DomainByIdProvider(
      id,
    );
  }

  @override
  DomainByIdProvider getProviderOverride(
    covariant DomainByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'domainByIdProvider';
}

/// See also [domainById].
class DomainByIdProvider extends AutoDisposeFutureProvider<Domain> {
  /// See also [domainById].
  DomainByIdProvider(
    int id,
  ) : this._internal(
          (ref) => domainById(
            ref as DomainByIdRef,
            id,
          ),
          from: domainByIdProvider,
          name: r'domainByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$domainByIdHash,
          dependencies: DomainByIdFamily._dependencies,
          allTransitiveDependencies:
              DomainByIdFamily._allTransitiveDependencies,
          id: id,
        );

  DomainByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Domain> Function(DomainByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DomainByIdProvider._internal(
        (ref) => create(ref as DomainByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Domain> createElement() {
    return _DomainByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DomainByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DomainByIdRef on AutoDisposeFutureProviderRef<Domain> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DomainByIdProviderElement
    extends AutoDisposeFutureProviderElement<Domain> with DomainByIdRef {
  _DomainByIdProviderElement(super.provider);

  @override
  int get id => (origin as DomainByIdProvider).id;
}

String _$domainViewModelHash() => r'0dd4b9ca27601f6918a5d92fe44f8ba2c72f350a';

/// See also [DomainViewModel].
@ProviderFor(DomainViewModel)
final domainViewModelProvider =
    AutoDisposeAsyncNotifierProvider<DomainViewModel, List<Domain>?>.internal(
  DomainViewModel.new,
  name: r'domainViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$domainViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DomainViewModel = AutoDisposeAsyncNotifier<List<Domain>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
