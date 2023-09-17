import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/login_view.dart'; // Ensure the path is correct
import './routes/app_pages.dart'; // Ensure the path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp instead of MaterialApp
      title: 'Your App Name',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
      debugShowCheckedModeBanner:
          false, // Set this to false to remove the debug banner
    );
  }
}
