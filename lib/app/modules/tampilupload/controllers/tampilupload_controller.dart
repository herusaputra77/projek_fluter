import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';

class TampiluploadController extends GetxController {
  //TODO: Implement TampiluploadController
  final box = GetStorage();

  Future<List<dynamic>> Tampilhasilfile() async {
    var response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/tampil/upload/file"),
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

  Future<void> downloadFile(String filename) async {
    final apiUrl =
        'http://10.0.2.2:8000/api/donwload/upload/file/$filename'; // Replace with your Laravel API URL

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        "Accept": "application/json",
        "authorization": "Bearer ${box.read('token')}"
      });
      if (response.statusCode == 200) {
        final appDir = await getApplicationDocumentsDirectory();
        final file = File('${appDir.path}/$filename');
        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded successfully to ${file.path}');
        print(response.body);
      } else {
        print('Failed to download the file');
        print(response.body);
      }
    } catch (e) {
      print('Error while downloading the file: $e');
    }
  }
}
