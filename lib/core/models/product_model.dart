import 'package:fruits_e_commerce/core/models/review_model.dart';

class ProductModel {
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
  final num avgRating = 0;
  final num ratingCounts = 0;
  final List<ReviewModel> reviews;
  final num sellingCount;

  ProductModel({
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
    required this.sellingCount,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      sellingCount: json['sellingCount'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      price: json['price'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
    );
  }
  toEntity() {
    return ProductModel(
      name: name,
      description: description,
      imageUrl: imageUrl,
      sellingCount: sellingCount,
      code: code,
      isFeatured: isFeatured,
      price: price,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e).toList(),
    );
  }

  toJson() {
    return {
      "name": name,
      "description": description,
      "imageUrl": imageUrl,
      "sellingCount": sellingCount,
      "code": code,
      "isFeatured": isFeatured,
      "price": price,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "avgRating": avgRating,
      "ratingCounts": ratingCounts,
      "reviews": reviews.map((review) => review.toJson()).toList(),
    };
  }
}
