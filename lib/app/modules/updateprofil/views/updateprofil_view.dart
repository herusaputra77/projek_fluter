import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/updateprofil_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UpdateprofilView extends GetView<UpdateprofilController> {
  Rx<PickedFile?> pickedImage = Rx<PickedFile?>(null);
  Rx<File?> _image = Rx<File?>(null);

  File? get image => _image.value;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                ClipOval(
                  child: GetBuilder<UpdateprofilController>(builder: (c) {
                    if (c.image != null) {
                      return Container(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(c.image!.path),
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      // if (controller.image12 != null) {
                      //   return Container(
                      //     height: 100,
                      //     width: 100,
                      //     child: Image.network(
                      //       controller.image12.text,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   );
                      //} else {
                      return Text('Image Choosen');
                    }
                  }),
                ),
                TextButton(
                    onPressed: () {
                      controller.pilihImages();
                    },
                    child: Text('Choosen'))
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: controller.emailController =
                      controller.emailController1,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: controller.usernameController =
                      controller.usernameController1,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: "Nama User",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: controller.nameController =
                      controller.nameController1,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: controller.passcController =
                      controller.PasscController1,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: controller.jabatan1 = controller.jabatan,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: "Jabatan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: controller.regis = controller.nomor_registrasi,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Nomor Registrasi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(height: 5),
              TextField(
                controller: controller.kelamin = controller.jenis_kelamin,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Jenis Kelamin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(height: 5),
              TextField(
                controller: controller.lahir = controller.tanggal_lahir,
                autocorrect: false,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(height: 5),
              TextField(
                controller: controller.alamat3 = controller.alamat,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(height: 5),
              TextField(
                controller: controller.hp = controller.no_hp,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Nomor HP",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.pengalaman =
                    controller.pengaalaman_kerja,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Pegalaman Kerja",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.pendidik = controller.pendidikan,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Pendidikan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.jadwal = controller.jadwal_kerja,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Jadwal Kerja",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.pelatihan = controller.riwayat_pelatihan,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Riwayat Pelatihan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.keahlian3 = controller.keahlian,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Keahlian",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.tugas =
                    controller.tugas_dan_tanggung_jawab,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Tugas dan Tanggung Jawab",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.darurat = controller.kontak_darurat,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Kontak Darurat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              TextField(
                controller: controller.riwayatmedis = controller.riwayat_medis,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                decoration: InputDecoration(
                    labelText: "Riwayat Medis",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.pilihImagemn();
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ],
    )));
  }
}
