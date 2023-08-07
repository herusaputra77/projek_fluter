import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_kemenkes/app/controllers/page_index_controller.dart';
import 'package:projek_kemenkes/app/modules/login/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'app/widgets/splash.dart';
import 'package:get_storage/get_storage.dart';

final PageC = Get.put(PageIndexController(), permanent: true);

void main() async {
  final PageC = Get.put(PageIndexController(), permanent: true);

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  String? token = prefs.getString('token');

  LoginController authController = Get.put(LoginController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final tokeni = box.read('token');
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Application",
    //   initialRoute: Routes.HOME,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: tokeni == null ? Routes.ONBOARDING : Routes.HOME,
            //initialRoute: Routes.HOME,
            getPages: AppPages.routes,
          );
        }
      },
    );
  }
}


//$2y$10$EqVeTU9CEyAPmQpAvszOtuU.T9/Y6cCTd7K6olV.bgc...