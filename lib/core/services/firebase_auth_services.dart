import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_e_commerce/core/error/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future DeleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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
        throw CustomException('خطأ في إنشاء المستخدم: ${e.message}');
      }
    } catch (e) {
      throw CustomException('خطأ في إنشاء المستخدم: $e');
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
      } else if (e.code == 'invalid-credential') {
        throw CustomException('البريد الالكتروني او الرقم السري غير صالح');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الالكتروني غير صالح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('خطأ في اتصال الشبكة.');
      } else {
        throw CustomException('خطأ في تسجيل الدخول: ${e.message}');
      }
    } catch (e) {
      dev.log(
        'Exception in firebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      throw CustomException('خطأ في تسجيل الدخول: $e');
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      // Initialize GoogleSignIn (required in v7+)
      await _googleSignIn.initialize();

      // Authenticate the user
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );

      // Get authentication tokens (synchronous in v7+)
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create Firebase credential using only idToken (which is sufficient for Firebase)
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        // Note: accessToken is not available in v7+ GoogleSignInAuthentication
        // Firebase can work with just idToken for basic authentication
      );

      // Sign in to Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } on GoogleSignInException catch (e) {
      dev.log('Google Sign-In Exception: ${e.code.name} - ${e.description}');

      // Handle specific Google Sign-In errors
      switch (e.code.name) {
        case 'canceled':
          throw CustomException('تم إلغاء تسجيل الدخول.');
        case 'interrupted':
          throw CustomException('تم مقاطعة تسجيل الدخول. حاول مرة أخرى.');
        case 'clientConfigurationError':
          throw CustomException('خطأ في إعدادات Google Sign-In.');
        case 'providerConfigurationError':
          throw CustomException('Google Sign-In غير متاح حالياً.');
        case 'uiUnavailable':
          throw CustomException('واجهة Google Sign-In غير متاحة.');
        case 'userMismatch':
          throw CustomException('مشكلة في الحساب. سجل الخروج وحاول مرة أخرى.');
        default:
          throw CustomException(
            'خطأ غير متوقع في Google Sign-In: ${e.description}',
          );
      }
    } on FirebaseAuthException catch (e) {
      dev.log(
        'Firebase Auth Error in Google Sign-In: ${e.code} - ${e.message}',
      );

      // Handle specific Firebase Auth errors
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          'يوجد حساب بهذا البريد الإلكتروني مع طريقة تسجيل دخول مختلفة.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException('بيانات الاعتماد غير صالحة.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException('تسجيل الدخول بـ Google غير مفعل.');
      } else if (e.code == 'user-disabled') {
        throw CustomException('تم تعطيل هذا الحساب.');
      } else {
        throw CustomException('خطأ في تسجيل الدخول بـ Google: ${e.message}');
      }
    } catch (e) {
      dev.log('General Error in Google Sign-In: $e');
      throw CustomException('خطأ في تسجيل الدخول بـ Google: $e');
    }
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
