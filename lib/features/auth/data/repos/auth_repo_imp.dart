import 'dart:developer' as dev;

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
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      dev.log('Unexpected error in createUserWithEmailAndPassword: $e');
      return left(ServerFailure('خطأ في إنشاء المستخدم: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      dev.log('Unexpected error in loginWithEmailAndPassword: $e');
      return left(ServerFailure('خطأ في تسجيل الدخول: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      if (user == null) {
        return left(ServerFailure('تم إلغاء تسجيل الدخول بـ Google'));
      }
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      dev.log('Unexpected error in loginWithGoogle: $e');
      return left(ServerFailure('خطأ في تسجيل الدخول بـ Google: $e'));
    }
  }
}