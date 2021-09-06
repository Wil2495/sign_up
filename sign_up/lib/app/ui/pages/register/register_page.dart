import 'package:flutter/material.dart';
import 'package:sign_up/app/ui/global_widgets/custom_input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomInputField(
                label: "Name",
                onChanged: (text) {},
                validator: (text) {
                  if (text == null) return null;
                  //   return isValidName(text) ? null : "invalid name";
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInputField(
                  label: "Last Name",
                  onChanged: (text) {},
                  validator: (text) {
                    if (text == null) return null;
                    // return isValidName(text) ? null : "invalid last name";
                  }),
              const SizedBox(height: 15),
              CustomInputField(
                  label: "Email",
                  inputype: TextInputType.emailAddress,
                  onChanged: (text) {},
                  validator: (text) {
                    print("text $text");
                    if (text == null) return null;
                    //  return isValidEmail(text) ? null : "invalid email";
                  }),
              const SizedBox(height: 15),
              CustomInputField(
                label: "Password",
                isPassword: true,
                inputype: TextInputType.visiblePassword,
                onChanged: (text) {},
                validator: (text) {
                  if (text == null) return null;
                  if (text.trim().length >= 6) {
                    return null;
                  } else {
                    return "Invalid password";
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomInputField(
                label: "Verification Password",
                isPassword: true,
                onChanged: (text) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
