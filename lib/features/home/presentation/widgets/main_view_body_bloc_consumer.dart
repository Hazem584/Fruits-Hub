import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إضافة المنتج إلى السلة'),
              duration: Duration(seconds: 1),
            ),
          );
        } else if (state is CartItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم حذف المنتج من السلة"),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
