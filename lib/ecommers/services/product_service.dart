import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();
  final List<ProductModel> prodcuts = List.empty(growable: true);
  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await _dio.get("https://elsewedyteam.runasp.net/api/Product/GetProducts");
      if (response.statusCode == 200) {
        for (var prod in (response.data['data']['products']) as List) {
          try {
            prodcuts.add(ProductModel.fromJson(prod));
          } catch (e) {
            break;
          }
        }
      } else {
        throw Exception("Request Problem, statuscode: ${response.statusCode}");
      }

      return prodcuts;
    } catch (e) {
      rethrow;
    }
  }
}
