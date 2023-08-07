import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final box = GetStorage();
  TextEditingController persent = TextEditingController();
  void logout() async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/logout"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        box.remove('token');
        Get.offAllNamed(Routes.LOGIN);

        Get.snackbar(
          'Berhasil Logout',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.yellow,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Terjadi Kesalahan',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.yellow,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> Persentase() async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/persentasi'), headers: {
      'Accept': 'Application/json',
      'Authorization': 'Bearier ${box.read('token')}'
    });
    if (response.statusCode == 200) {
      print(response.body);
      final sondat = json.decode(response.body);
      persent.text = sondat;
    } else {
      print(response.body);

      // Get.snackbar(
      //   'Terjadi Kesalahan',
      //   json.decode(response.body)['message'],
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.yellow,
      //   colorText: Colors.white,
      // );
    }
  }
}
