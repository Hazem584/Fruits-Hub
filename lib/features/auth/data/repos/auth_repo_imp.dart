import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce/core/error/exceptions.dart';
import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/core/services/firebase_auth_services.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_model.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImp({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('An unexpected error occurred: $e'));
    }
  }
}
