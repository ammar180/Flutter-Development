import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService productService = ProductService();
  Future<List<ProductModel>> get getProductsList => productService.getProducts();
}
