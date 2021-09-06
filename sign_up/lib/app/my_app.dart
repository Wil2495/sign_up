import 'package:flutter/material.dart';
import 'ui/routes/app_routes.dart';
import 'ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign_up Google",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: appRoutes,
    );
  }
}
