import '../models/product_model.dart';
import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.product,
    required this.index,
  });
  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(product.image),
              Text(product.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(backgroundColor: Colors.yellow))
            ],
          ),
        ),
      ),
    );
  }
}
