import 'package:fruits_e_commerce/core/entities/review_entity.dart';

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) {
    return 0.0;
  }

  var sum = 0.0;
  for (var review in reviews) {
    sum += review.rating.toDouble();
  }
  final average = sum / reviews.length;
  return double.parse(average.toStringAsFixed(1));
}
