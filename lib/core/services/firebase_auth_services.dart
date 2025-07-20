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
}
