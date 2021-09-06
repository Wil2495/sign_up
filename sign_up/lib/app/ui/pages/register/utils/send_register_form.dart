import 'package:flutter/material.dart';
import 'package:sign_up/app/ui/routes/routes.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    final response = await controller.submit();
    if (response.error != null) {
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.home,
      );
    }
  } else {}
}
