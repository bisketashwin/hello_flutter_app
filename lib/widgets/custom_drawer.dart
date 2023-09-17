// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import for GetX

import '../routes/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("path_to_image"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Get.toNamed(Routes.SETTINGS),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            onTap: () => Get.toNamed(Routes.PROFILE_EDIT),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () => Get.toNamed(Routes.LOGIN),
          ),
        ],
      ),
    );
  }
}
