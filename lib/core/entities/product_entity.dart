import 'dart:io';
import 'package:fruits_e_commerce/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String description;
  final String? imageUrl;
  final String code;
  final bool isFeatured;
  final num price;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCounts;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.code,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.reviews,
    this.avgRating = 0,
    this.ratingCounts = 0,
  });

  ProductEntity copyWith({
    String? name,
    String? description,
    String? imageUrl,
    String? code,
    bool? isFeatured,
    File? imagePath,
    num? price,
    int? expirationMonths,
    bool? isOrganic,
    int? numberOfCalories,
    int? unitAmount,
    num? avgRating,
    num? ratingCounts,
    List<ReviewEntity>? reviews,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      code: code ?? this.code,
      isFeatured: isFeatured ?? this.isFeatured,
      price: price ?? this.price,
      expirationMonths: expirationMonths ?? this.expirationMonths,
      numberOfCalories: numberOfCalories ?? this.numberOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      isOrganic: isOrganic ?? this.isOrganic,
      reviews: reviews ?? this.reviews,
      avgRating: avgRating ?? this.avgRating,
      ratingCounts: ratingCounts ?? this.ratingCounts,
    );
  }
}
