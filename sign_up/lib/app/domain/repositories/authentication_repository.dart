import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_up/app/domain/responses/sign_in_response.dart';

abstract class AuthenticationRepository {
  //si esto retorna un valor null quiere decir que no hay sesión iniciada.
  Future<User?> get user;
  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password);
}
