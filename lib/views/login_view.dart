// login_view.dart

import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'sign_up_view.dart';

class LoginView extends StatefulWidget {
  final Key? key;
  LoginView({this.key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Properly dispose of the TabController
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: [],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.transparent, // This makes it transparent
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              tabs: [
                customTab("Email", Icons.email),
                customTab("Phone", Icons.phone),
              ],
            ),
          ), // ... rest of the TabBar configuration
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          emailView(controller, _tabController, emailController,
              phoneController, passwordController),
          phoneView(controller, _tabController, emailController,
              phoneController, passwordController),
        ],
      ),
    );
  }
}

Widget customTab(String label, IconData icon) {
  return Tab(
    // icon: Icon(icon, color: Colors.grey),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 8.0),
        Text(label),
      ],
    ),
  );
}

Widget emailView(
    LoginController controller,
    TabController tabController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          SizedBox(height: 20.0),
          passwordField(controller, passwordController),
          // loginAndSignUpButtons(controller),
          loginAndSignUpButtons(controller, tabController, emailController,
              phoneController, passwordController),
        ],
      ),
    ),
  );
}

Widget phoneView(
    LoginController controller,
    TabController tabController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone Number",
            ),
          ),
          SizedBox(height: 20.0),
          passwordField(controller, passwordController),
          // loginAndSignUpButtons(controller),
          loginAndSignUpButtons(controller, tabController, emailController,
              phoneController, passwordController),
        ],
      ),
    ),
  );
}

Widget passwordField(
    LoginController controller, TextEditingController passwordController) {
  return Column(
    children: [
      TextFormField(
        controller: passwordController, // Add this line
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              controller.togglePasswordVisibility();
            },
          ),
        ),
      ),
      SizedBox(height: 20.0),
    ],
  );
}

Widget loginAndSignUpButtons(
    LoginController controller,
    TabController tabController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          // You should fetch the user and password from the TextFormFields
          // bool isValid = controller.validateUser(userInput, passwordInput);
          String userInput = tabController.index == 0
              ? emailController.text
              : phoneController.text;
          String passwordInput = passwordController.text;

          bool isValid = controller.validateUser(userInput, passwordInput);
          if (isValid) {
            Get.toNamed(Routes.HOME);
          } else {
            // Show error
          }
        },
        child: Text("Login"),
      ),
      SizedBox(height: 20.0),
      TextButton(
        onPressed: () => Get.to(() => SignUpView()),
        child: Text("Don't have an account? Sign up"),
      ),
    ],
  );
}

Widget customerSupportButton(BuildContext context) {
  return Row(
    children: [
      Text("Call us for help"), // Added text
      FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                "Customer Support",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          );
        },
        child: Icon(Icons.call),
      ),
    ],
  );
}
