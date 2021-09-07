import 'package:flutter/cupertino.dart';
import 'package:sign_up/app/domain/responses/reset_password_response.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:sign_up/app/utils/email_validator.dart';

import '../reset_password_page.dart' show resetProvider;

void submit(BuildContext context) async {
  final controller = resetProvider.read;
  if (isValidEmail(controller.email)) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    Navigator.pop(context);
    if (response == ResetPasswordResponse.ok) {
      Dialogs.alert(context, title: "GOOD", content: "Email sent");
    } else {
      String errorMessage = "";
      switch (response) {
        case ResetPasswordResponse.networkRequestFailed:
          errorMessage = "networkRequestFailed";
          break;
        case ResetPasswordResponse.userDisabled:
          errorMessage = "userDisabled";
          break;
        case ResetPasswordResponse.userNotFound:
          errorMessage = "userNotFound";
          break;
        case ResetPasswordResponse.tooManyRequest:
          errorMessage = "tooManyRequest";
          break;
        default:
          errorMessage = "unknown error";
          break;
      }
      Dialogs.alert(context, title: "ERROR", content: errorMessage);
    }
  } else {
    Dialogs.alert(context, content: "Invalid email");
  }
}
