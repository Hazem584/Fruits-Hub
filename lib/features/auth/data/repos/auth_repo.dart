import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  // Future<Either<Failure, void>> signOut();
  // Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  // Future<Either<Failure, void>> deleteUser();
  // Future<Either<Failure, void>> updateUserEmail(String email);
}
