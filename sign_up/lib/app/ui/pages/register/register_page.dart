import 'package:flutter/material.dart';

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
              TextFormField(
                decoration: const InputDecoration(labelText: "name"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "last name"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
