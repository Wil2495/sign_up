import 'package:flutter/cupertino.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:sign_up/app/utils/email_validator.dart';

import '../reset_password_page.dart' show resetProvider;

void submit(BuildContext context) async {
  final controller = resetProvider.read;
  if (isValidEmail(controller.email)) {
    ProgressDialog.show(context);
    Navigator.pop(context);
  } else {
    Dialogs.alert(context, content: "Invalid email");
  }
}
