import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  //si esto retorna un valor null quiere decir que no hay sesión iniciada.
  Future<User?> get user;
}
