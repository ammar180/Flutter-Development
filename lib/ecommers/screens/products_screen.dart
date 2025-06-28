import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_cart.dart';
import '../providers/product_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Consumer<ProductProvider>(
        builder:
            (context, prov, child) => FutureBuilder(
              future: prov.getProductsList,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 400,
                          ),
                      itemBuilder:
                          (context, index) => ProductCart(
                            product: snapshot.data![index],
                            index: index,
                          ),
                      itemCount: snapshot.data?.length,
                    )
                    : snapshot.hasError
                    ? Center(
                      child: Column(
                        children: [
                          const Icon(Icons.error, size: 50, color: Colors.red),
                          Text(
                            'Error: ${snapshot.error}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
      ),
    );
  }
}
