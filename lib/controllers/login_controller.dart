// login_controller.dart

import 'package:get/get.dart';

class LoginController extends GetxController {
  // ... other fields ...

  RxBool isEmailMode = true.obs; // Make sure this line exists
  RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Dummy user data for validation
  final dummyUser = {
    'phone': '1234567890',
    'password': '123456',
    'email': 'test@dummy.com',
  };

  // Add observable for registration fields
  RxString regEmail = ''.obs;
  RxString regPassword = ''.obs;

  // Existing login() method ...

  void register() {
    final enteredEmail = regEmail.value;
    final enteredPassword = regPassword.value;

    // Here, you would typically send these values to your server to create a new user.
    // For simplicity, we're just setting the dummy user's values.
    dummyUser['email'] = enteredEmail;
    dummyUser['password'] = enteredPassword;

    Get.snackbar("Success", "User registered successfully!");
  }

  bool validateUser(String user, String password) {
    if (dummyUser['email'] == user || dummyUser['phone'] == user) {
      if (dummyUser['password'] == password) {
        return true;
      }
    }
    return false;
  }
}
