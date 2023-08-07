import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class HasilsupervisiController extends GetxController {
  //TODO: Implement HasilsupervisiController
  final box = GetStorage();

  Future<List<dynamic>> Tampilhasil() async {
    var response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/tampil/hasil/supervisi"),
        headers: {
          "Accept": "application/json",
          "authorization": "Bearer ${box.read('token')}"
        });

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body)['data'];
    } else {
      print(response.body);
      Get.snackbar('Terjadi KEsalahan', '${response.body}');
      throw Exception('Terjadi Kesalahan: ${response.body}');
    }
  }
}
