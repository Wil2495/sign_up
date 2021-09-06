import 'package:flutter/Widgets.dart' show Widget, BuildContext;
import 'package:sign_up/app/ui/pages/splash/splash_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes =>
    {Routes.splash: (_) => const SplashPage()};
