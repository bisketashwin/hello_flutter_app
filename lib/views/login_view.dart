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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: 500,
              height: 200,
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              // color:
              // Color.fromARGB(255, 255, 62, 62), // This makes it transparent
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
            ),
            Container(
              width: 500,
              height: 250,
              // color: Color.fromARGB(255, 143, 255, 253),
              child: TabBarView(
                controller: _tabController,
                children: [
                  emailView(controller, _tabController, emailController,
                      phoneController, passwordController),
                  phoneView(controller, _tabController, emailController,
                      phoneController, passwordController),
                ],
              ),
            ),
            Container(child: signUpButton(context)),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(child: customerSupportButton(context))),
          ],
        ),
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          labelText: "Email",
        ),
      ),
      const SizedBox(height: 20.0),
      passwordField(controller, passwordController),
      // loginAndSignUpButtons(controller),
      loginAndSignUpButtons(controller, tabController, emailController,
          phoneController, passwordController),
    ],
  );
}

Widget phoneView(
    LoginController controller,
    TabController tabController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController) {
  return Container(
    color: const Color.fromARGB(255, 225, 234, 236),
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: "Phone Number",
          ),
        ),
        const SizedBox(height: 20.0),
        passwordField(controller, passwordController),
        // loginAndSignUpButtons(controller),
        loginAndSignUpButtons(controller, tabController, emailController,
            phoneController, passwordController),
      ],
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
    ],
  );
}

Widget signUpButton(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: TextButton(
      onPressed: () => Get.toNamed(Routes.SIGNUP),
      child: const Text("Don't have an account? Sign up"),
    ),
  );
}

Widget customerSupportButton(BuildContext context) {
  var iconSize = 20.0;
  var circleSize = 35.0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const Text("Call us for help"),
      Stack(alignment: Alignment.center, children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue, // Replace with your desired background color
          ),
        ),
        IconButton(
          iconSize: iconSize,
          icon: const Icon(Icons.call, color: Colors.white), // Icon color
          onPressed: () {
            helpPopUp(context);
          },
        ),
      ]),
    ],
  );
}

Widget customerSupportButton2(BuildContext context) {
  var iconSize = 20.0;
  var circleSize = 35.0;
  return Align(
    alignment: Alignment.bottomRight,
    child: Row(
      children: [
        const Text("Call us for help"),
        Stack(alignment: Alignment.center, children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, // Replace with your desired background color
            ),
          ),
          IconButton(
            iconSize: iconSize,
            icon: const Icon(Icons.call, color: Colors.white), // Icon color
            onPressed: () {
              helpPopUp(context);
            },
          ),
        ]),
      ],
    ),
  );
}

void helpPopUp(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Flex(
        direction:
            Axis.vertical, // you can change this to Axis.horizontal if needed
        children: [
          Text(
            "Customer Support",
            style: TextStyle(color: Colors.blue),
          ),
          // you can add more widgets here to be displayed vertically
        ],
      ),
    ),
  );
}
