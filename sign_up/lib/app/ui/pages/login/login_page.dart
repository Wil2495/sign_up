import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_up/app/ui/global_widgets/custom_input_field.dart';
import 'package:sign_up/app/ui/pages/login/controller/login_controller.dart';
import 'package:sign_up/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/utils/email_validator.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomInputField(
                        label: "Email",
                        onChanged: controller.onEmailChange,
                        inputype: TextInputType.emailAddress,
                        validator: (text) {
                          if (isValidEmail(text!)) {
                            return null;
                          }
                          return "Invalid email";
                        },
                      ),
                      const SizedBox(height: 20.0),
                      CustomInputField(
                        label: "Password",
                        isPassword: true,
                        onChanged: controller.onPasswordChange,
                        validator: (text) {
                          if (text!.trim().length >= 6) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () =>
                            controller.formkey.currentState!.validate(),
                        child: const Text("Login"),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () => router.pushNamed(Routes.register),
                        child: const Text("Sign up"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
