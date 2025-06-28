class ProductModel {
  final String name;
  final String image;
  final String description;
  final int price;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price});
  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      name: json['name'],
      image: json['imageUrl'],
      description: json['description'],
      price: json['price'],
    );
  }
}
