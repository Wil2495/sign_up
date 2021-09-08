import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:sign_up/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/ui/pages/home/tabs/home/home_tab.dart';
import 'package:sign_up/app/ui/pages/home/tabs/profile/profile_tab.dart';
import 'package:sign_up/app/ui/pages/home/widgets/home_tab_bar.dart';

final homeProvider = SimpleProvider(
  (_) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<HomeController>(
      provider: homeProvider,
      builder: (_, controller) {
        return Scaffold(
          bottomNavigationBar: HomeTabBar(),
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
