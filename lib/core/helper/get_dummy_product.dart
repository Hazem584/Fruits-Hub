import 'package:fruits_e_commerce/core/entities/product_entity.dart';
import 'package:fruits_e_commerce/core/entities/review_entity.dart';

// Assuming you have the ProductEntity class available
// Here's how to create an instance:
ProductEntity getProductEntity() {
  return ProductEntity(
    name: "Fresh Red Apple",
    description:
        "Crispy and sweet red apples, perfect for snacking or baking. Rich in vitamins and fiber.",
    price: 2.99,
    imageUrl:
        "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/396e9/MainBefore.jpg",
    code: "APPLE001",
    isFeatured: true,
    expirationMonths: 2,
    numberOfCalories: 95,
    unitAmount: 6, // 6 apples per unit
    isOrganic: true,
    reviews: [
      ReviewEntity(
        name: "John Doe",
        image: "https://example.com/images/user1.jpg",
        rating: 4.5,
        reviewDescription: "Delicious and fresh apples! Highly recommend.",
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
      ReviewEntity(
        name: "Jane Smith",
        image: "https://example.com/images/user2.jpg",
        rating: 4.0,
        reviewDescription: "Good quality apples, but a bit pricey.",
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ],
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(5, (index) => getProductEntity());
}
