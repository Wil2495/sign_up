import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:sign_up/app/domain/helpers/sign_up.dart';
import 'package:sign_up/app/domain/repositories/sign_up_repository.dart';
import 'register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.i.find<SignUpRepository>();

  Future<SignUpResponse> submit() {
    return _signUpRepository.register(
      SignUpData(
          name: state.name,
          lastname: state.lastname,
          email: state.email,
          password: state.password),
    );
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
