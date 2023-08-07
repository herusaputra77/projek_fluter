import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DetailprofilController extends GetxController {
  //TODO: Implement DetailprofilController

  @override
  void onInit() {
    super.onInit();
    TampilDetailprofil();
  }

  final box = GetStorage();
  Future<Map<String, dynamic>> TampilDetailprofil() async {
    var response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/user/profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      if (data is Map<String, dynamic>) {
        // Pastikan data dari API berupa Map<String, dynamic>
        return data;
      } else {
        print('Data from API is not in Map format');
        return {};
      }
    } else {
      print(response.body);
      return {};
    }
  }
}
