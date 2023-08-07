import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../../controllers/page_index_controller.dart';
import '../../login/controllers/login_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/detailprofil_controller.dart';

class DetailprofilView extends GetView<DetailprofilController> {
  DetailprofilView({
    Key? key,
  }) : super(key: key);
  // Holds the fetched data
  final PageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: FutureBuilder<Map<String, dynamic>>(
            future: controller.TampilDetailprofil(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                // Jika data berhasil didapatkan dari API
                var data = snapshot.data!;
                return SafeArea(
                  child: ListView(
                    children: [
                      // Container(
                      //   height: 300,
                      //   width: 300,
                      //   child: Image.network('${data['image']}'),
                      // ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 50.0,
                                          minRadius: 50.0,
                                          backgroundColor: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(' ${data['name']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(' ${data['email']}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () => Get.offAllNamed(
                                                  Routes.UPDATEPROFIL),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.amberAccent,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(50),
                                                        topRight:
                                                            Radius.circular(50),
                                                        bottomLeft:
                                                            Radius.circular(50),
                                                        bottomRight:
                                                            Radius.circular(50),
                                                      )),
                                                  height: 30,
                                                  width: 100,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text('Edit Profil',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Username',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['username']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jenis Kelamin',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['jenis_kelamin']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Tanggal Lahir',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['tanggal_lahir']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Alamat',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['alamat']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('NOHP',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['no_hp']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Pengalaman Kerja',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['pengaalaman_kerja']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jabatan',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['jabatan']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nomor Registrasi',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['nomor_registrasi']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Pendidikan',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['pendidikan']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jadwal Kerja',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['jadwal_kerja']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Riwayat Pelatihan',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['riwayat_pelatihan']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Keahlian',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['keahlian']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(' Tugas dan Tanggung Jawab',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(
                                          ' ${data['tugas_dan_tanggung_jawab']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Kontak Darurat',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['kontak_darurat']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(' Riwayat Medis',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text(' ${data['riwayat_medis']}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.note_add, title: 'Penilaian'),
            TabItem(icon: Icons.supervised_user_circle, title: 'Profil'),
          ],
          initialActiveIndex: PageC.pageIndex.value,
          onTap: (int i) => PageC.Changepage(i),
        ));
  }
}
