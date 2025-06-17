import 'package:equatable/equatable.dart';
import 'package:product_app/features/products/data/models/rating_model.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final RatingModel rating;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        category,
        image,
        rating,
      ];
}
