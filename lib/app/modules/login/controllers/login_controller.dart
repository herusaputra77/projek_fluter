import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController userControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  TextEditingController idControl = TextEditingController();

  TextEditingController roleControl = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isHidden = false.obs;

  final tokeni = ''.obs;
  final userchan = ''.obs;
  final box = GetStorage();
  final userchani = GetStorage();
  Future<void> login(String username, String token) async {
    if (userControl.text.isNotEmpty && passControl.text.isNotEmpty) {
      isLoading.value = true;

      try {
        var data = {
          'username': userControl.text,
          'password': passControl.text,
        };

        var response = await http.post(
          Uri.parse('http://10.0.2.2:8000/api/auth/login'),
          headers: {
            'Accept': 'application/json',
          },
          body: data,
        );

        if (response.statusCode == 200) {
          isLoading.value = false;
          tokeni.value = json.decode(response.body)['token'];

          Get.snackbar('Sukses Login', "Selamat Datang Dihalaman Home");
          userControl.text = json.decode(response.body)['user']['username'];
          userchan.value = json.decode(response.body)['user']['username'];
          roleControl.text = json.decode(response.body)['user']['role'];
          // idControl.text = json.decode(response.body)['user']['id'].toString();

          String username = json.decode(response.body)['user']['username'];
          String token = json.decode(response.body)['token'];

          box.write('token', tokeni.value);
          userchani.write('userchan', userchan.value);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', username);
          await prefs.setString('token', token);
          Get.offAllNamed(Routes.HOME);
          print(response.body);
          // Lakukan penanganan sesuai kebutuhan Anda
        } else {
          Get.snackbar(
              "Terjadi Kesalahan", "${json.decode(response.body)['message']}");
          print(response.body);
        }
      } catch (e) {
        // Tutup indikator loading
        isLoading.value = false;

        // Tampilkan pesan kesalahan
        print(e.toString());
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Username dan Password Wajib Diisi");
    }
  }
}
