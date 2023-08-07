import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/uploadfile_controller.dart';

class UploadfileView extends GetView<UploadfileController> {
  UploadfileView({Key? key}) : super(key: key);
  final PageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
          child: Stack(children: [
            Image.asset('assets/dash/fr.jpeg', fit: BoxFit.cover),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 184, 69, 212),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(5, 5),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Text(
                                'Petunjuk: \n Untuk Upload File Silahkan isi menu  keterangan terlebih dahulu \n pastikan nama file yang anda upload sesuai dengan judul isi kinerja anda',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    TextField(
                      controller: controller.keterangan,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Keterangan File",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.uploadFile();
                        },
                        child: Text("upload File"))
                  ]),
            ),
          ]),
        )),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          activeColor: Color.fromARGB(255, 62, 3, 97),
          color: Colors.deepPurpleAccent[100],
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.note_add, title: 'Penilaian'),
            TabItem(icon: Icons.supervised_user_circle, title: 'Profil'),
            // if (_loginController.roleControl.text == 'admin')
            //   TabItem(icon: Icons.verified_user_sharp, title: 'Tambah'),
          ],
          initialActiveIndex: PageC.pageIndex.value,
          onTap: (int i) => PageC.Changepage(i),
        ));
  }
}
