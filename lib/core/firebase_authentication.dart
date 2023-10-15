import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizzling/core/authentication.dart';
import 'package:quizzling/errors/wrong_credentials_exception.dart';
import 'package:quizzling/models/user_model.dart';

class FirebaseAuthentication extends Authentication {
  @override
  Future<UserModel> signIn({required email, required password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        email: email,
        name: credential.user?.displayName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw WrongCredentialsException();
      } else {
        throw Exception(e.message);
      }
    }
  }
}
