import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_pages.dart';
import 'package:image_picker/image_picker.dart';

class UpdateprofilController extends GetxController {
  //TODO: Implement UpdateprofilController
  Rx<PickedFile?> _pickedfile = Rx<PickedFile?>(null);
  Rx<XFile?> pickedImage = Rx<XFile?>(null);

  File? _image;
  final picker = ImagePicker();
  final box = GetStorage();

  final iamg = GetStorage();
  XFile? image;
  final ImagePicker pickerto = ImagePicker();

  TextEditingController nameController1 = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController usernameController1 = TextEditingController();
  TextEditingController PasscController1 = TextEditingController();
  TextEditingController nomor_registrasi = TextEditingController();
  TextEditingController jenis_kelamin = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController tanggal_lahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController no_hp = TextEditingController();
  TextEditingController pengaalaman_kerja = TextEditingController();
  TextEditingController pendidikan = TextEditingController();
  TextEditingController jadwal_kerja = TextEditingController();
  TextEditingController keahlian = TextEditingController();
  TextEditingController riwayat_pelatihan = TextEditingController();
  TextEditingController tugas_dan_tanggung_jawab = TextEditingController();
  TextEditingController kontak_darurat = TextEditingController();
  TextEditingController riwayat_medis = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> pilihImages() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.name);
      print(image!.path);
      print(image!.name.split(".").last);
    } else {
      print(image);
    }
    update();
  }

  Future<void> pilihImagemn() async {
    if (image != null) {
      var imageFile = await image!.readAsBytes();

      var request = http.MultipartRequest(
        'POst',
        Uri.parse('http://10.0.2.2:8000/api/user/update/profile'),
      );

      var pic = await http.MultipartFile.fromPath('image', image!.path,
          filename: image!.name);
      request.files.add(pic);

      request.fields['name'] = nameController1.text;
      request.fields['username'] = usernameController1.text;
      request.fields['email'] = emailController1.text;
      request.fields['password'] = PasscController1.text;
      request.fields['jabatan'] = jabatan.text;
      request.fields['nomor_registrasi'] = nomor_registrasi.text;
      request.fields['jenis_kelamin'] = jenis_kelamin.text;
      request.fields['tanggal_lahir'] = tanggal_lahir.text;
      request.fields['alamat'] = alamat.text;
      request.fields['no_hp'] = no_hp.text;
      request.fields['pengaalaman_kerja'] = pengaalaman_kerja.text;
      request.fields['pendidikan'] = pendidikan.text;
      request.fields['jadwal_kerja'] = jadwal_kerja.text;
      request.fields['riwayat_pelatihan'] = riwayat_pelatihan.text;
      request.fields['keahlian'] = keahlian.text;
      request.fields['tugas_dan_tanggung_jawab'] =
          tugas_dan_tanggung_jawab.text;
      request.fields['kontak_darurat'] = kontak_darurat.text;
      request.fields['riwayat_medis'] = riwayat_medis.text;

      request.headers['Authorization'] = 'Bearer ${box.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';

      var response = await request.send();

      // Get the response body as a string
      var responseBody = await response.stream.bytesToString();

      // Check the response status code
      if (response.statusCode == 200) {
        print('Profile updated successfully');
        print('Response Body: $responseBody');
      } else {
        print('Failed to update profile');
        print('Response Body: $responseBody');
      }
    } else {
      // User canceled image selection
      print('Tidak ada gambar yang dipilih');
    }
  }

  Future<void> pilihImage() async {
    try {
      if (image != null) {
        final uri = Uri.parse('http://10.0.2.2:8000/api/user/update/profile');
        var request = http.MultipartRequest('POST', uri);

        request.fields['name'] =
            nameController1.text; // Replace with the desired name
        request.fields['username'] =
            usernameController1.text; // Replace with the desired class
        request.fields['email'] = emailController1.text;
        request.fields['password'] = PasscController1.text;
        var pic = await http.MultipartFile.fromPath("image", image!.path);
        request.files.add(pic);

        var response = await request.send();
        if (response.statusCode == 200) {
          print('Image uploaded successfully');
          print(response.request);
          Get.snackbar("Berhasil", "${response.request}");
        } else {
          print('Failed to upload image');
          print(response.request);
          Get.snackbar("Terjadi Kesalahan", "${response.request}");
        }
      } else {
        print('tidak ada');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passcController = TextEditingController();
  TextEditingController jabatan1 = TextEditingController();
  TextEditingController image12 = TextEditingController();
  TextEditingController regis = TextEditingController();
  TextEditingController kelamin = TextEditingController();
  TextEditingController lahir = TextEditingController();
  TextEditingController alamat3 = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController pengalaman = TextEditingController();
  TextEditingController pendidik = TextEditingController();
  TextEditingController jadwal = TextEditingController();
  TextEditingController pelatihan = TextEditingController();
  TextEditingController keahlian3 = TextEditingController();
  TextEditingController tugas = TextEditingController();
  TextEditingController darurat = TextEditingController();
  TextEditingController riwayatmedis = TextEditingController();

//update
  // TextEditingController nameController1 = TextEditingController();
  // TextEditingController emailController1 = TextEditingController();
  // TextEditingController usernameController1 = TextEditingController();
  // TextEditingController PasscController1 = TextEditingController();

//end update
//end update
  @override
  void onInit() {
    super.onInit();
    TampilDetail();
  }

  void TampilDetail() async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/user/profile'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read('token')}',
    });
    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = json.decode(response.body);
      nameController.text = jsonData['name'];
      emailController.text = jsonData['email'];
      usernameController.text = jsonData['username'];
      passcController.text = jsonData['password'];
      jabatan1.text = jsonData['jabatan']?.toString() ?? '';
      regis.text = jsonData['nomor_registrasi']?.toString() ?? '';
      kelamin.text = jsonData['jenis_kelamin']?.toString() ?? '';
      lahir.text = jsonData['tanggal_lahir']?.toString() ?? '';
      alamat3.text = jsonData['alamat']?.toString() ?? '';
      hp.text = jsonData['no_hp']?.toString() ?? '';
      pengalaman.text = jsonData['pengaalaman_kerja']?.toString() ?? '';
      pendidik.text = jsonData['pendidikan']?.toString() ?? '';
      jadwal.text = jsonData['jadwal_kerja']?.toString() ?? '';
      pelatihan.text = jsonData['riwayat_pelatihan']?.toString() ?? '';
      keahlian3.text = jsonData['keahlian']?.toString() ?? '';
      tugas.text = jsonData['tugas_dan_tanggung_jawab']?.toString() ?? '';
      darurat.text = jsonData['kontak_darurat']?.toString() ?? '';
      riwayatmedis.text = jsonData['riwayat_medis']?.toString() ?? '';
      image12.text = jsonData['image']?.toString() ?? '';

      print(response.body);

      Get.snackbar("Berhasil", "${json.decode(response.body)['message']}");
    }
  }

  // Future<void> Updatepro() async {
  //   try {
  //     List<int>? imageBytes = pickedImage.value != null
  //         ? await pickedImage.value!.readAsBytes()
  //         : null;

  //     // Jika gambar ada, lakukan encoding base64
  //     String? encodedImage =
  //         imageBytes != null ? base64Encode(imageBytes) : null;
  //     String? imageName =
  //         pickedImage.value != null ? pickedImage.value!.name : null;

  //     var data = {
  //       'name': nameController1.text,
  //       'username': usernameController1.text,
  //       'email': emailController1.text,
  //       'password': PasscController1.text,
  //       'jabatan': 'jabccc',
  //       'nomor_registrasi': "nomor_registrasi.text",
  //       'jenis_kelamin': 'in.text',
  //       'tanggal_lahir': '_lahir.text',
  //       'alamat': 'alamat.text',
  //       'no_hp': ' no_hp.text',
  //       'pengaalaman_kerja': '_kerja.text',
  //       'pendidikan': 'idikan.text',
  //       'jadwal_kerja': '_kerja.text',
  //       'riwayat_pelatihan': 'atihan.text',
  //       'keahlian': 'ahlian.text',
  //       'tugas_dan_tanggung_jawab': '_jawab.text',
  //       'kontak_darurat': 'encodedImage',
  //       'riwayat_medis': 'imageName',
  //     };

  //     var response = await http.put(
  //       Uri.parse('http://10.0.2.2:8000/api/user/update/profile'),
  //       headers: {
  //         'Accept': 'Application/json',
  //         'Authorization': 'Bearer ${box.read('token')}',
  //       },
  //       body: data,
  //     );

  //     if (response.statusCode == 200) {
  //       print(response.body);
  //     } else {
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print('Error during profile update: $e');
  //   }
  // }

  Future<void> Updatepro() async {
    try {
      if (image == null) {
        print('Tidak ada gambar yang dipilih');
        return;
      }

      var imageBytes = await pickedImage.value!.readAsBytes();
      String encodedImage = base64Encode(imageBytes!);
      String imageName = pickedImage.value!.name ?? '';

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('http://10.0.2.2:8000/api/user/update/profile'),
      );

      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ${box.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';

      // Tambahkan data sebagai bagian dari fields
      request.fields['name'] = nameController1.text;
      request.fields['username'] = usernameController1.text;
      request.fields['email'] = emailController1.text;
      request.fields['password'] = PasscController1.text;
      request.fields['jabatan'] = 'jabccc';
      request.fields['nomor_registrasi'] = 'nomor_registrasi.text';
      request.fields['jenis_kelamin'] = 'in.text';
      request.fields['tanggal_lahir'] = '_lahir.text';
      request.fields['alamat'] = 'alamat.text';
      request.fields['no_hp'] = ' no_hp.text';
      request.fields['pengaalaman_kerja'] = '_kerja.text';
      request.fields['pendidikan'] = 'idikan.text';
      request.fields['jadwal_kerja'] = '_kerja.text';
      request.fields['riwayat_pelatihan'] = 'atihan.text';
      request.fields['keahlian'] = 'ahlian.text';
      request.fields['tugas_dan_tanggung_jawab'] = '_jawab.text';
      request.fields['kontak_darurat'] = encodedImage;
      request.fields['riwayat_medis'] = imageName;

      // Tambahkan gambar sebagai file ke request
      var pic = http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: imageName,
      );
      request.files.add(pic);

      var response = await request.send();

      // Get the response body as a string
      var responseBody = await response.stream.bytesToString();

      // Check the response status code
      if (response.statusCode == 200) {
        print('Profile updated successfully');
        print('Response Body: $responseBody');
      } else {
        print('Failed to update profile');
        print('Response Body: $responseBody');
      }
    } catch (e) {
      print('Error during profile update: $e');
    }
  }

  void showErrorMessage(String message) {
    // Tampilkan pesan kesalahan kepada pengguna (misalnya menggunakan snackbar)
    // Contoh: Get.snackbar('Error', message);
  }
}
