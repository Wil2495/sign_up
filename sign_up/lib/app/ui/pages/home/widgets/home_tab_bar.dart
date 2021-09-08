import 'package:flutter/material.dart';
import 'package:sign_up/app/ui/pages/home/home_page.dart';
import '../../../utils/dark_mode_extension.dart';

class HomeTabBar extends StatelessWidget {
  HomeTabBar({Key? key}) : super(key: key);
  final _homeController = homeProvider.read;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkThemeModeExtension;
    return SafeArea(
      top: false,
      child: TabBar(
        unselectedLabelColor: isDark == true ? Colors.white30 : Colors.black26,
        labelColor: Colors.blue,
        indicator: _CustomIndicator(),
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(icon: Icon(Icons.person_rounded)),
        ],
        controller: _homeController.tabController,
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter();
  }
}

class _CirclePainter extends BoxPainter {
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final size = configuration.size!;
    final paint = Paint();
    paint.color = Colors.blue;
    final center = Offset(offset.dx + size.width * 0.5, size.height * 0.8);
    canvas.drawCircle(center, 3, paint);
  }
}
