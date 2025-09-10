part of 'product_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

final class ProductCubitLoading extends ProductCubitState {}

final class ProductCubitError extends ProductCubitState {
  final String message;
  ProductCubitError({required this.message});
}

final class ProductCubitSuccess extends ProductCubitState {
  final List<ProductEntity> products;

  ProductCubitSuccess(this.products);
}
