import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce/core/error/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الالكتروني مستخدم بالفعل.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الالكتروني غير صالح');
      } else {
        throw CustomException('خطأ في إنشاء المستخدم: ${e.message}');
      }
    } catch (e) {
      throw CustomException('خطأ في إنشاء المستخدم: $e');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الالكتروني غير صالح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('خطأ في اتصال الشبكة.');
      } else {
        throw CustomException('خطأ في تسجيل الدخول: ${e.message}');
      }
    } catch (e) {
      dev.log(
        'Exception in firebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      throw CustomException('خطأ في تسجيل الدخول: $e');
    }
  }
}
