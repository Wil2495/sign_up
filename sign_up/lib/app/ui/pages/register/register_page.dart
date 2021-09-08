import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/state.dart';
import 'package:sign_up/app/ui/global_controllers/session_controller.dart';
import 'package:sign_up/app/ui/global_widgets/custom_input_field.dart';
import 'package:sign_up/app/utils/email_validator.dart';
import 'package:sign_up/app/utils/name_validator.dart';
import 'controller/register_controller.dart';
import 'controller/register_state.dart';
import 'utils/send_register_form.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(15.0),
                  children: [
                    CustomInputField(
                      label: "Name",
                      onChanged: controller.onLastNameChanged,
                      validator: (text) {
                        return isValidName(text!) ? null : "invalid name";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputField(
                        label: "Last Name",
                        onChanged: controller.onLastNameChanged,
                        validator: (text) {
                          return isValidName(text!)
                              ? null
                              : "invalid last name";
                        }),
                    const SizedBox(height: 15),
                    CustomInputField(
                        label: "Email",
                        inputype: TextInputType.emailAddress,
                        onChanged: controller.onEmailChanged,
                        validator: (text) {
                          return isValidEmail(text!) ? null : "invalid email";
                        }),
                    const SizedBox(height: 15),
                    CustomInputField(
                      label: "Password",
                      onChanged: controller.onPasswordChanged,
                      isPassword: true,
                      inputype: TextInputType.visiblePassword,
                      validator: (text) {
                        if (text!.trim().length >= 6) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                    const SizedBox(height: 15),
                    Consumer(builder: (_, watch, __) {
                      watch(registerProvider.select((state) => state.password));
                      return CustomInputField(
                        label: "Verification Password",
                        isPassword: true,
                        onChanged: controller.onVPasswordChanged,
                        validator: (text) {
                          if (controller.state.password != text) {
                            return "password don't match";
                          }
                          if (text!.trim().length >= 6) {
                            return null;
                          }
                          return "Invalid password";
                        },
                      );
                    }),
                    const SizedBox(height: 30.0),
                    MaterialButton(
                      child: const Text("Register"),
                      color: Colors.blue,
                      onPressed: () => sendRegisterForm(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
