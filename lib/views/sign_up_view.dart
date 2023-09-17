// sign_up_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class SignUpView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => controller.regEmail.value = value,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (value) => controller.regPassword.value = value,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: controller.register,
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: customerSupportButton(context),
    );
  }

  Widget customerSupportButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Customer Support"),
          ),
        );
      },
      child: Icon(Icons.call),
    );
  }
}
