import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';
import 'package:sign_up/app/ui/pages/splash/controller/splash_controller.dart';
import 'package:flutter_meedu/router.dart' as router;

final splashProvider = SimpleProvider(
    (_) => SplashController(sessionProvider.read),
    autoDispose: true);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(routeName);
        }
      },
      builder: (_, __) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
