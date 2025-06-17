import 'package:flutter/material.dart';
import 'package:product_app/features/products/domain/entities/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(product.image),
              const SizedBox(height: 16),
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text('\$${product.price}', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 12),
              Text(
                'Category: ${product.category}',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 12),
              Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
