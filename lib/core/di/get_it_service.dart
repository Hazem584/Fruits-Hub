import 'package:fruits_e_commerce/core/services/firebase_auth_services.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthServices>(
    FirebaseAuthServices(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
