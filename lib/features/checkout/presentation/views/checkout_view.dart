import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/di/get_it_service.dart';
import 'package:fruits_e_commerce/core/helper/get_user.dart';
import 'package:fruits_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/add_order_cubit_bloc_builder.dart';
import 'package:provider/provider.dart';
import 'package:fruits_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderInputEntity(
        uID: getUser()!.uId,
        cartEntity,
        shippingAddress: ShippingAddressEntity(),
        place: 'checkout view',
      ),
      child: BlocProvider(
        create: (context) => AddOrderCubit(getIt<OrdersRepo>()),
        child: Scaffold(
          appBar: BuildAppBar(context, title: "الشحن", showNotification: false),
          body: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
