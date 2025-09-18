import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrders(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
