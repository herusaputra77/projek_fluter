import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  bool _obscureText = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/login.png',
                  width: size.width * 0.90,
                ),
                Container(
                  width: size.width * 0.8,
                  child: TextField(
                    controller: controller.userControl,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Masukkan Username",
                        fillColor: Colors.white70,
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Obx(
                    () => TextField(
                      controller: controller.passControl,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isHidden.toggle();
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        hintText: "Masukkan Password",
                        fillColor: Colors.white70,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () async {
                        // controller.Pass();
                        // Get.toNamed(Routes.HOME);
                        if (controller.isLoading.isFalse) {
                          await controller.login(
                              usernameController.text, tokenController.text);
                        }
                      },
                      child: Text(controller.isLoading.isFalse
                          ? "Login"
                          : "Sedang Memuat.."),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    )));
  }
}
