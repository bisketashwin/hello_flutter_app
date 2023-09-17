import 'package:get/get.dart';

class HomeController extends GetxController {
  // RxString is a reactive version of String from GetX.
  // It will automatically notify listeners (i.e., the UI) when the value changes.
  var userName = 'Default Name'.obs;
  var userProfileImagePath = 'path_to_default_image'.obs;

  // Function to update user's name.
  void updateUserName(String newName) {
    userName.value = newName;
  }

  // Function to update user's profile image path.
  void updateUserProfileImagePath(String newPath) {
    userProfileImagePath.value = newPath;
  }
}
