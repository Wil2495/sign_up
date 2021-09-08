import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:sign_up/app/domain/helpers/sign_up.dart';
import 'package:sign_up/app/domain/repositories/sign_up_repository.dart';
import 'package:sign_up/app/domain/responses/sign_up_response.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';
import 'register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUpRepository _signUpRepository = Get.i.find();
  final SessionController _sessionController;
  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
          name: state.name,
          lastname: state.lastname,
          email: state.email,
          password: state.password),
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  void onFirstNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onLastNameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vpassword: text);
  }
}
