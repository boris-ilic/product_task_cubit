import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductListItem({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(title),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
      onTap: onTap,
    );
  }
}
