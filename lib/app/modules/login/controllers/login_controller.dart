import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_kemenkes/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var checkC = false.obs;
  bool _obscureText = true;

  TextEditingController phoneC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  void Pass() async {
    if (phoneC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      if (phoneC.text == "admin" && passwordC.text == "admin") {
        await Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Terjadi Kesalahan", "User Atau Password Salah");
      }
    } else {
      Get.snackbar(
          "Terjadi Kesalahan", "User Atau Password Tidak Boleh Kosong");
    }
  }

  void onClose() {
    phoneC.dispose();
    super.onClose();
  }
}
