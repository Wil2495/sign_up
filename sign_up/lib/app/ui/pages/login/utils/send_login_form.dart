import 'package:flutter/widgets.dart';
import 'package:sign_up/app/domain/responses/sign_in_response.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:sign_up/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:sign_up/app/ui/routes/routes.dart';
import '../login_page.dart' show loginProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formkey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String errorMessage = "";
      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "network Request Failed";
          break;
        case SignInError.userDisabled:
          errorMessage = "user Disabled";
          break;
        case SignInError.userNotFound:
          errorMessage = "user Not Found";
          break;
        case SignInError.wrongPassword:
          errorMessage = "wrong Password";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "unknown";
          break;
      }
      Dialogs.alert(context, title: "Error", content: errorMessage);
    } else {
      router.pushNamedAndRemoveUntil(Routes.home);
    }
  } else {
    Dialogs.alert(context, title: "ERROR", content: "Invalid fields");
  }
}
