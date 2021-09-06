import 'package:flutter/material.dart';
import 'ui/routes/app_routes.dart';
import 'ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign_up Google",
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}
