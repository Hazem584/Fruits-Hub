import 'package:fruits_e_commerce/core/repos/products_repos/product_repo.dart';
import 'package:fruits_e_commerce/core/repos/products_repos/product_repo_impl.dart';
import 'package:fruits_e_commerce/core/services/database_service.dart';
import 'package:fruits_e_commerce/core/services/firebase_auth_services.dart';
import 'package:fruits_e_commerce/core/services/firestore_service.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
