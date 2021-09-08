import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:sign_up/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/ui/pages/home/tabs/home/home_tab.dart';
import 'package:sign_up/app/ui/pages/home/tabs/profile/profile_tab.dart';

final HomeProvider = SimpleProvider(
  (_) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<HomeController>(
      provider: HomeProvider,
      builder: (_, controller) {
        return Scaffold(
          body: SafeArea(
            child: TabBarView(
              controller: controller.tabController,
              children: const [HomeTab(), ProfileTab()],
            ),
          ),
        );
      },
    );
  }
}
