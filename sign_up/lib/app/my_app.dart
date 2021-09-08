import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_up/app/ui/global_controllers/theme_controller.dart';
import 'ui/routes/app_routes.dart';
import 'ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, wath, __) {
      final theme = wath(themeProvider);
      return MaterialApp(
        title: "Sign_up Google",
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        themeMode: theme.mode,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        navigatorObservers: [
          router.observer,
        ],
        routes: appRoutes,
      );
    });
  }
}
