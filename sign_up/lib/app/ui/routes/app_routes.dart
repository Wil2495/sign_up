import 'package:flutter/Widgets.dart' show Widget, BuildContext;
import 'package:flutter/cupertino.dart';
import 'package:sign_up/app/ui/pages/home/home_page.dart';
import 'package:sign_up/app/ui/pages/login/login_page.dart';
import 'package:sign_up/app/ui/pages/register/register_page.dart';
import 'package:sign_up/app/ui/pages/reset_password/reset_password_page.dart';
import 'package:sign_up/app/ui/pages/splash/splash_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.splash: (_) => const SplashPage(),
      Routes.login: (_) => const LoginPage(),
      Routes.home: (_) => const HomePage(),
      Routes.register: (_) => const RegisterPage(),
      Routes.reset_password: (_) => const ResetPassword()
    };
