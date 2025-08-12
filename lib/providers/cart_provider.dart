import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:show_online_app/models/product_model.dart';

part 'cart_provider.g.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({int? quantity}) {
    return CartItem(product: product, quantity: quantity ?? this.quantity);
  }

  double get totalPrice => (product.price ?? 0) * quantity;
}

class CartState {
  final List<CartItem> items;
  final double totalAmount;
  final int totalItems;

  CartState({
    this.items = const [],
    this.totalAmount = 0.0,
    this.totalItems = 0,
  });

  CartState copyWith({
    List<CartItem>? items,
    double? totalAmount,
    int? totalItems,
  }) {
    return CartState(
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    return CartState();
  }

  void addToCart(Product product) {
    final currentItems = List<CartItem>.from(state.items);
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex >= 0) {
      currentItems[existingItemIndex] = currentItems[existingItemIndex]
          .copyWith(quantity: currentItems[existingItemIndex].quantity + 1);
    } else {
      currentItems.add(CartItem(product: product, quantity: 1));
    }

    _updateState(currentItems);
  }

  void removeFromCart(Product product) {
    final currentItems = state.items
        .where((item) => item.product.id != product.id)
        .toList();

    _updateState(currentItems);
  }

  void updateQuantity(Product product, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(product);
      return;
    }

    final currentItems = state.items.map((item) {
      if (item.product.id == product.id) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();

    _updateState(currentItems);
  }

  void clearCart() {
    state = CartState();
  }

  void _updateState(List<CartItem> items) {
    final totalAmount = items.fold<double>(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );

    final totalItems = items.fold<int>(0, (sum, item) => sum + item.quantity);

    state = CartState(
      items: items,
      totalAmount: totalAmount,
      totalItems: totalItems,
    );
  }

  bool isInCart(Product product) {
    return state.items.any((item) => item.product.id == product.id);
  }

  int getQuantity(Product product) {
    final item = state.items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    return item.quantity;
  }
}
