// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subtitleNameHash() => r'2d9ea4f69d661e870f3c09b460d8d32d1b2a7d10';

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

/// See also [subtitleName].
@ProviderFor(subtitleName)
const subtitleNameProvider = SubtitleNameFamily();

/// See also [subtitleName].
class SubtitleNameFamily extends Family<AsyncValue<String?>> {
  /// See also [subtitleName].
  const SubtitleNameFamily();

  /// See also [subtitleName].
  SubtitleNameProvider call(
    int id,
  ) {
    return SubtitleNameProvider(
      id,
    );
  }

  @override
  SubtitleNameProvider getProviderOverride(
    covariant SubtitleNameProvider provider,
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
  String? get name => r'subtitleNameProvider';
}

/// See also [subtitleName].
class SubtitleNameProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [subtitleName].
  SubtitleNameProvider(
    int id,
  ) : this._internal(
          (ref) => subtitleName(
            ref as SubtitleNameRef,
            id,
          ),
          from: subtitleNameProvider,
          name: r'subtitleNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subtitleNameHash,
          dependencies: SubtitleNameFamily._dependencies,
          allTransitiveDependencies:
              SubtitleNameFamily._allTransitiveDependencies,
          id: id,
        );

  SubtitleNameProvider._internal(
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
    FutureOr<String?> Function(SubtitleNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubtitleNameProvider._internal(
        (ref) => create(ref as SubtitleNameRef),
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
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _SubtitleNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubtitleNameProvider && other.id == id;
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
mixin SubtitleNameRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SubtitleNameProviderElement
    extends AutoDisposeFutureProviderElement<String?> with SubtitleNameRef {
  _SubtitleNameProviderElement(super.provider);

  @override
  int get id => (origin as SubtitleNameProvider).id;
}

String _$subtitleViewModelHash() => r'7f29f695fcbd59311f98a2525da3d46a6542b48a';

/// See also [SubtitleViewModel].
@ProviderFor(SubtitleViewModel)
final subtitleViewModelProvider = AutoDisposeAsyncNotifierProvider<
    SubtitleViewModel, List<Subtitle>?>.internal(
  SubtitleViewModel.new,
  name: r'subtitleViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subtitleViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SubtitleViewModel = AutoDisposeAsyncNotifier<List<Subtitle>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
