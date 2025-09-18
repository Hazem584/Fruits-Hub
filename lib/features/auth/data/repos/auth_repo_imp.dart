import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce/core/error/exceptions.dart';
import 'package:fruits_e_commerce/core/error/failures.dart';
import 'package:fruits_e_commerce/core/helper/constants.dart';
import 'package:fruits_e_commerce/core/services/database_service.dart';
import 'package:fruits_e_commerce/core/services/firebase_auth_services.dart';
import 'package:fruits_e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce/core/utils/backend_endpoint.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_model.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImp({
    required this.databaseService,
    required this.firebaseAuthServices,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;

    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, email: email, name: name);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      dev.log('Unexpected error in createUserWithEmailAndPassword: $e');
      return left(ServerFailure('خطأ في إنشاء المستخدم: $e'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      dev.log('Unexpected error in loginWithEmailAndPassword: $e');
      return left(ServerFailure('خطأ في تسجيل الدخول: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      if (user == null) {
        return left(ServerFailure('تم إلغاء تسجيل الدخول بـ Google'));
      }

      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);
      var isUserExists = await databaseService.checkIfDocumentExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );
      try {
        if (isUserExists) {
          await getUserData(uId: user.uid);
        } else {
          await addUserData(user: userEntity);
        }
      } catch (e) {
        dev.log('User might already exist: $e');
      }

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      dev.log('Unexpected error in loginWithGoogle: $e');
      return left(ServerFailure('خطأ في تسجيل الدخول بـ Google: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var isUserExists = await databaseService.checkIfDocumentExists(
        path: BackendEndpoint.isUserExists,
        documentId: user.uid,
      );

      try {
        if (isUserExists) {
          await getUserData(uId: user.uid);
        } else {
          await addUserData(user: userEntity);
        }
      } catch (e) {
        dev.log('User might already exist: $e');
      }

      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      dev.log('Unexpected error in loginWithFacebook: $e');
      return left(ServerFailure('خطأ في تسجيل الدخول بـ Facebook: $e'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    try {
      var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
      await Prefs.setString(kUserData, jsonData);
    } catch (e) {
      dev.log('Error saving user data: $e');
      throw CustomException('خطأ في حفظ بيانات المستخدم');
    }
  }
}
