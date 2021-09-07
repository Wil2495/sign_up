import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/domain/repositories/authentication_repository.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = "";
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final GlobalKey<FormState> formkey = GlobalKey();

  void onEmailChange(String text) {
    _email = text;
  }

  void onPasswordChange(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() {
    return _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);
  }
}
