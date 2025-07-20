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
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {  
        throw CustomException('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('The email address is not valid.');
      } else {
        throw CustomException('An unknown error occurred: ${e.message}');
      }
    } catch (e) {
      throw CustomException('An error occurred while creating user: $e');
    }
  }
}
