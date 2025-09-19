import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrders({required OrderInputEntity order});
}
