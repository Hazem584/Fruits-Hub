import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce/core/entities/product_entity.dart';
import 'package:fruits_e_commerce/core/repos/products_repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  ProductCubit(this.productRepo) : super(ProductCubitInitial());

  final ProductRepo productRepo;
  int productLength = 0;
  Future<void> fetchAllProducts() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductCubitError(message: failure.message)),
      (products) {
        final List<ProductEntity> entities = products
            .map((product) => product.toEntity())
            .toList();
        productLength = entities.length;
        emit(ProductCubitSuccess(entities));
      },
    );
  }

  Future<void> fetchBestSellingProducts() async {
    emit(ProductCubitLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductCubitError(message: failure.message)),
      (products) {
        final List<ProductEntity> entities = products
            .map((product) => product.toEntity())
            .toList();
        productLength = entities.length;
        emit(ProductCubitSuccess(entities));
      },
    );
  }
}
