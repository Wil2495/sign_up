import 'package:flutter/material.dart';
import 'package:sign_up/app/domain/helpers/sign_up.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:sign_up/app/ui/routes/routes.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "email already in use";
          break;
        case SignUpError.weakPassword:
          content = "weak password";
          break;
        default:
          content = "error unknown";
          break;
      }
      Dialogs.alert(context, title: "Error", content: content);
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.home,
      );
    }
  } else {
    Dialogs.alert(context, title: "ERROR", content: "Invalid fields");
  }
}
