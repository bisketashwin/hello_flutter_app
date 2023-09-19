import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import './views/login_view.dart'; // Ensure the path is correct
import './routes/app_pages.dart'; // Ensure the path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Set this to false to remove the debug banner
      title: 'Your App Name',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const LoginView(),
    );
  }
}
