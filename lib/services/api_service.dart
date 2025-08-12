import 'package:dio/dio.dart';
import 'package:show_online_app/models/product_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('$_baseUrl/products');

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data;
        return dataList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load products with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
