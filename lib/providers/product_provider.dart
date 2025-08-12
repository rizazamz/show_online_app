import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:show_online_app/models/product_model.dart';
import 'package:show_online_app/services/api_service.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  Future<List<Product>> build() async {
    return _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    final apiService = ApiService();
    return apiService.getProducts();
  }
}
