import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

}