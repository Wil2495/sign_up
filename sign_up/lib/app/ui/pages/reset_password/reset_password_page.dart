import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:sign_up/app/ui/global_widgets/custom_input_field.dart';
import 'package:sign_up/app/ui/pages/reset_password/controller/reset_password_controller.dart';

import 'utils/send_reset_password_form.dart';

final resetProvider =
    SimpleProvider((_) => ResetPasswordController(), autoDispose: true);

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<ResetPasswordController>(
        provider: resetProvider,
        builder: (_, controller) => Scaffold(
              appBar: AppBar(),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomInputField(
                          label: "Email",
                          onChanged: controller.onEmailChanged,
                          inputype: TextInputType.emailAddress,
                        ),
                        ElevatedButton(
                            onPressed: () => submit(context),
                            child: const Text("Send")),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
