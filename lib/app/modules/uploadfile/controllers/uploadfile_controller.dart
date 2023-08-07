import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UploadfileController extends GetxController {
  //TODO: Implement UploadfileController
  final box = GetStorage();
  final userchani = GetStorage();

  TextEditingController username = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg' 'pdf', 'doc', 'png', 'mp4', 'mkv'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      var request = http.MultipartRequest(
          'POST', Uri.parse('http://10.0.2.2:8000/api/uploadfile'));

      request.headers['Authorization'] = 'Bearer ${box.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';
      if (file.path != null) {
        File selectedFile =
            File(file.path!); // Buat objek File dari path yang dipilih.
        List<int> fileBytes = await selectedFile
            .readAsBytes(); // Baca konten file sebagai List<int>.
        // Baca konten file sebagai List<int>.
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: file.path,
        ));
      } else {
        print('kosong');
      }

      request.fields['username'] = '${userchani.read('userchan')}';
      request.fields['keterangan'] = keterangan.text;
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Get.snackbar(
          "Berhasil",
          json.decode(responseBody)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('Response Body: $responseBody');
      } else {
        print('File gagal diupload');
        print('Response Body: $responseBody');
      }
    }
  }
}
