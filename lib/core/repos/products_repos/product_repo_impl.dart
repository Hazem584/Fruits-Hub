import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/core/models/product_model.dart';
import 'package:fruits_e_commerce/core/repos/products_repos/product_repo.dart';
import 'package:fruits_e_commerce/core/services/database_service.dart';
import 'package:fruits_e_commerce/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductModel>>> getBestSellingProducts() async {
    try {
      print('Fetching best selling products...');

      final result = await databaseService.getData(
        path: BackendEndpoint.getProducts,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      );

      print('Raw data type: ${result.runtimeType}');
      print('Raw data: $result');

      if (result == null) {
        print('No data received from Firebase');
        return right(<ProductModel>[]);
      }

      List<Map<String, dynamic>> data;

      // التحقق من نوع البيانات المُرجعة
      if (result is List<Map<String, dynamic>>) {
        data = result;
      } else if (result is List) {
        data = result.cast<Map<String, dynamic>>();
      } else {
        print('Unexpected data type: ${result.runtimeType}');
        return left(ServerFailure('Unexpected data format'));
      }

      print('Processing ${data.length} products');

      List<ProductModel> products = data.map((e) {
        try {
          return ProductModel.fromJson(e);
        } catch (parseError) {
          print('Error parsing product: $parseError');
          print('Product data: $e');
          rethrow;
        }
      }).toList();

      print('Successfully processed ${products.length} products');
      return right(products);
    } catch (e) {
      print('Error in getBestSellingProducts: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      print('Fetching all products...');

      final result = await databaseService.getData(
        path: BackendEndpoint.getProducts,
      );

      print('Raw data type: ${result.runtimeType}');
      print(
        'Raw data length: ${result is List ? result.length : 'Not a list'}',
      );

      if (result == null) {
        print('No data received from Firebase');
        return right(<ProductModel>[]);
      }

      List<Map<String, dynamic>> data;

      // التحقق من نوع البيانات المُرجعة
      if (result is List<Map<String, dynamic>>) {
        data = result;
      } else if (result is List) {
        data = result.cast<Map<String, dynamic>>();
      } else {
        print('Unexpected data type: ${result.runtimeType}');
        return left(ServerFailure('Unexpected data format'));
      }

      print('Processing ${data.length} products');

      List<ProductModel> products = data.map((e) {
        try {
          return ProductModel.fromJson(e);
        } catch (parseError) {
          print('Error parsing product: $parseError');
          print('Product data: $e');
          rethrow;
        }
      }).toList();

      print('Successfully processed ${products.length} products');
      return right(products);
    } catch (e) {
      print('Error in getProducts: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
