import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';
import 'package:sign_up/app/ui/global_controllers/theme_controller.dart';
import '../../../../utils/dark_mode_extension.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final sessionController = watch(sessionProvider);
    final isDark = context.isDarkThemeModeExtension;
    final user = sessionController.user!;
    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[1] : "";

    return ListView(
      children: [
        const SizedBox(height: 20.0),
        CircleAvatar(
          radius: 75,
          child: user.photoURL == null
              ? Text(
                  letter,
                  style: const TextStyle(fontSize: 65),
                )
              : null,
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Text(
            displayName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(child: Text(user.email ?? "")),
        const SizedBox(height: 20.0),
        // const Text("User data"),
        LabelButton(
          label: "Display Name",
          value: displayName,
          onPressed: () {},
        ),
        LabelButton(
          label: "User Email",
          value: user.email ?? '',
        ),
        LabelButton(
          label: "User Email",
          value: user.emailVerified ? 'YES' : 'NO',
        ),
        CupertinoSwitch(
            value: isDark,
            onChanged: (_) {
              themeProvider.read.toggle();
            })
      ],
    );
  }
}

class LabelButton extends StatelessWidget {
  const LabelButton(
      {Key? key, required this.label, required this.value, this.onPressed})
      : super(key: key);
  final String label, value;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkThemeModeExtension;
    final iconColor = isDark ? Colors.white30 : Colors.black45;
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
      leading: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(width: 5.0),
          Icon(
            Icons.chevron_right_rounded,
            size: 22.0,
            color: onPressed != null ? iconColor : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
