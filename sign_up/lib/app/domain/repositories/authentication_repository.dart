import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  //si esto retorna un valor null quiere decir que no hay sesión iniciada.
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password);
}

class SignInResponse {
  final String? error;
  final User? user;

  SignInResponse(this.error, this.user);
}
