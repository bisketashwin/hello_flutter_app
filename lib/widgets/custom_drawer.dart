// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import for GetX

import '../routes/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("path_to_image"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Get.toNamed(Routes.SETTINGS),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () => Get.toNamed(Routes.PROFILE_EDIT),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () => Get.toNamed(Routes.LOGIN),
          ),
        ],
      ),
    );
  }
}
