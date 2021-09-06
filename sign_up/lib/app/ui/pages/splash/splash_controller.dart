import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/domain/repositories/authentication_repository.dart';

class SplashController {
  final _authRepository = Get.i.find<AuthenticationRepository>();

  SplashController() {
    _init();
  }
  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      print("😃");
    } else {
      print("😪");
    }
  }
}
