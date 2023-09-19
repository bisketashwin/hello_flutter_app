import 'package:hello_flutter_app/views/profile_edit_view.dart';
import 'package:hello_flutter_app/views/settings_view.dart';
import 'package:hello_flutter_app/views/sign_up_view.dart';
import 'package:hello_flutter_app/views/tabs/tab_1_view.dart';
import 'package:hello_flutter_app/views/understand_layout/my_layout_1.dart';

import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/tabs/tab_2_view.dart';
import '../views/tabs/tab_3_view.dart';
import '../views/understand_layout/custom_scroll_view.dart';
import 'app_routes.dart';
import 'package:get/get.dart'; // Import for GetX

class AppPages {
  static const INITIAL = Routes.MYLAYOUT1;
  static final List<GetPage> routes = [
    GetPage(name: Routes.MYLAYOUT1, page: () => const MyLayout1()),
    GetPage(name: Routes.MYLAYOUT2, page: () => const MyLayout2()),
    GetPage(name: Routes.LOGIN, page: () => const LoginView()),
    GetPage(name: Routes.SIGNUP, page: () => SignUpView()),
    GetPage(name: Routes.HOME, page: () => const HomeView()),
    GetPage(name: Routes.SETTINGS, page: () => const Settings()),
    GetPage(name: Routes.PROFILE_EDIT, page: () => const ProfileEdit()),
    GetPage(name: Routes.TAB1_SCREEN1, page: () => const Tab1View()),
    GetPage(name: Routes.TAB1_SCREEN2, page: () => const Tab2View()),
    GetPage(name: Routes.TAB1_SCREEN3, page: () => const Tab3View()),
    // ... other pages name: Routes.TAB1_SCREEN3 comes from app_routes.dart page is actual screen dart page the widget name in ithe dart file
  ];
}
