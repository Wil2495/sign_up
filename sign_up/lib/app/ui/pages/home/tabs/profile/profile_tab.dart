import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProvider);
    return Container(child: Text("Profile Tab"));
  }
}
