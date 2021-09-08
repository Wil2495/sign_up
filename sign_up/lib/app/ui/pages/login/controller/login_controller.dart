import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/domain/repositories/authentication_repository.dart';
import 'package:sign_up/app/domain/responses/sign_in_response.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  String _email = '', _password = "";
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final GlobalKey<FormState> formkey = GlobalKey();

  LoginController(this._sessionController);

  void onEmailChange(String text) {
    _email = text;
  }

  void onPasswordChange(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() async {
    final response = await _authenticationRepository.signInWithEmailAndPassword(
        _email, _password);
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }
}
