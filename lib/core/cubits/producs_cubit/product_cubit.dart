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
    print('Starting fetchAllProducts...');
    emit(ProductCubitLoading());

    try {
      final result = await productRepo.getProducts();
      print('Repository result: $result');

      result.fold(
        (failure) {
          print('Failure: ${failure.message}');
          emit(ProductCubitError(message: failure.message));
        },
        (products) {
          print('Success: ${products.length} products received');

          final List<ProductEntity> entities = products
              .map((product) => product.toEntity())
              .toList();

          productLength = entities.length;
          print('Converted to ${entities.length} entities');

          if (entities.isEmpty) {
            emit(ProductCubitError(message: 'لا توجد منتجات متاحة'));
          } else {
            emit(ProductCubitSuccess(entities));
          }
        },
      );
    } catch (e) {
      print('Unexpected error in fetchAllProducts: $e');
      emit(ProductCubitError(message: 'حدث خطأ غير متوقع: $e'));
    }
  }

  Future<void> fetchBestSellingProducts() async {
    print('Starting fetchBestSellingProducts...');
    emit(ProductCubitLoading());

    try {
      final result = await productRepo.getBestSellingProducts();
      print('Repository result: $result');

      result.fold(
        (failure) {
          print('Failure: ${failure.message}');
          emit(ProductCubitError(message: failure.message));
        },
        (products) {
          print('Success: ${products.length} best selling products received');

          final List<ProductEntity> entities = products
              .map((product) => product.toEntity())
              .toList();

          productLength = entities.length;
          print('Converted to ${entities.length} entities');

          if (entities.isEmpty) {
            emit(ProductCubitError(message: 'لا توجد منتجات مميزة متاحة'));
          } else {
            emit(ProductCubitSuccess(entities));
          }
        },
      );
    } catch (e) {
      print('Unexpected error in fetchBestSellingProducts: $e');
      emit(ProductCubitError(message: 'حدث خطأ غير متوقع: $e'));
    }
  }

  // إعادة تحميل البيانات
  Future<void> refreshProducts({bool isBestSelling = false}) async {
    if (isBestSelling) {
      await fetchBestSellingProducts();
    } else {
      await fetchAllProducts();
    }
  }
}
