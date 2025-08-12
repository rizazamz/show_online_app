// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CartNotifier)
const cartNotifierProvider = CartNotifierProvider._();

final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, CartState> {
  const CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartState>(value),
    );
  }
}

String _$cartNotifierHash() => r'bcb7686ace27c6a0320325d631b61dc278830841';

abstract class _$CartNotifier extends $Notifier<CartState> {
  CartState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CartState, CartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CartState, CartState>,
              CartState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
