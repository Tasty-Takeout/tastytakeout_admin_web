import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'controllers/login_controller.dart';
import 'views/screens/dashboard_screen.dart';
import 'views/screens/login_screen.dart';

void main() async {
  // await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Dashboard',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
        GetPage(name: '/dashboard', page: () => DashboardPage(), binding: DashboardBinding()),
      ],
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}