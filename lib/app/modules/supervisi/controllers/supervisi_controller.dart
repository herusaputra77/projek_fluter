import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';

class SupervisiController extends GetxController {
  //TODO: Implement SupervisiController

  RxInt currentIndex = 0.obs;
  RxList<dynamic> kuisdata = <dynamic>[].obs;
  RxInt selectedValue = RxInt(0);
  RxInt score = RxInt(0);
  RxBool isQuizFinished = RxBool(false);
  RxBool isChecked = false.obs;

  final LoginController _loginController = Get.find();
  final box = GetStorage();
  final userchani = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Datakuis();
  }

  void toggleChecked() {
    isChecked.toggle(); // Memperbarui status tanda centang ketika ditekan
  }

  Future<List<dynamic>> Datakuis() async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/tampil/super"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var data = responseData['data'];
      if (data != null) {
        print(data);
        kuisdata.assignAll(data);
        return data;
      } else {
        throw Exception('Data kosong');
      }
    } else {
      print(response.body);
      throw Exception('Gagal mengambil data');
    }
  }

  void answerQuestion() {
    // var kuisku = kuisdata[currentIndex.value];

    if (currentIndex.value < kuisdata.length - 1) {
      currentIndex.value++;
    } else {
      print('Semua pertanyaan telah dijawab');
      print(score.value);
      String username = _loginController.userControl.text;
      String nameti = _loginController.userControl.text;
      // String idUser = _loginController.idControl.toString();

      saveDataToDatabase(score.value,
          username); // Panggil fungsi saveDataToDatabase dengan parameter yang sesuai

      Get.snackbar('Skor', 'Skor kamu adalah ${score.value}');
    }
  }

  void saveDataToDatabase(int score, String username) async {
    var data = {
      'score': score.toString(),
      'username': '${userchani.read('userchan')}',
    };

    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/hasil/super'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
      body: data,
    );

    if (response.statusCode == 200) {
      // Tutup indikator loading

      // Tampilkan pesan error jika ada
      Get.offAllNamed(Routes.HOME);
      print(response.body);
      Get.snackbar(
        'Terima Kasih Telah Melakukan Penilaian',
        json.decode(response.body)['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      print(response.body);
    } else {
      Get.offAllNamed(Routes.HOME);
      print(response.body);
      Get.snackbar(
        "Terjadi Kesalahan",
        json.decode(response.body)['message'],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
