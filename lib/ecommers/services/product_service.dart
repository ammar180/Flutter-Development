import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();
  final List<ProductModel> prodcuts = List.empty(growable: true);
  Future<List<ProductModel>> getProducts() async {
    var response = await _dio.get(
      "https://elsewedyteam.runasp.net/api/Product/GetProducts",
    );

    return (response.data['response'] as List)
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
  }
}
