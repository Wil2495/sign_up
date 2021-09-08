import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';
import 'package:sign_up/app/ui/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(builder: (_, watch, __) {
              final user = watch(sessionProvider).user!;
              return Text(user.displayName ?? '');
            }),
            const Text("HOME PAGE"),
            const SizedBox(height: 20.0),
            CupertinoButton(
              child: const Text("Sign out"),
              color: Colors.blue,
              onPressed: () async {
                sessionProvider.read.signOut();
                router.pushNamedAndRemoveUntil(Routes.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
