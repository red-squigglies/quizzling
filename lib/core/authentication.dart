import 'package:quizzling/models/user_model.dart';

abstract class Authentication {
  Future<UserModel> signIn({required email, required password});
}
