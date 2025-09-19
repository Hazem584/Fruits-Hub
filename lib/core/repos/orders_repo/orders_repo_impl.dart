import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce/core/services/database_service.dart';
import 'package:fruits_e_commerce/core/utils/backend_endpoint.dart';
import 'package:fruits_e_commerce/features/checkout/data/models/order_model.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;
  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrders({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await databaseService.addData(
        documentId: orderModel.orderId,
        path: BackendEndpoint.addOrders,
        data: orderModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
