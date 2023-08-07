import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  TextEditingController nameControl = TextEditingController();
  TextEditingController usernameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> Register() async {
    // if (nameControl.text.isNotEmpty &&
    //     usernameControl.text.isNotEmpty &&
    //     emailControl.text.isNotEmpty &&
    //     passwordControl.text.isNotEmpty) {

    try {
      isLoading.value = true;

      var data = {
        'name': nameControl.text,
        'username': usernameControl.text,
        'email': emailControl.text,
        'password': passwordControl.text,
        'role': 'user'
      };

      var response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/auth/register'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        // Tutup indikator loading
        isLoading.value = false;

        // Tampilkan pesan error jika ada
        Get.snackbar(
          'User Berhasil Ditambahkan',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        print(response.body);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
          "Terjadi Kesalahan",
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(response.body);
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
    // } else {
    //   Get.snackbar("Terjadi Kesalahan", "Data Harus Lengkap Diisi");
    // }
  }
}
