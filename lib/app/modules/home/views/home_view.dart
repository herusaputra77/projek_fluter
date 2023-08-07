import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controllers/page_index_controller.dart';
import '../../login/controllers/login_controller.dart';
import 'color.dart' as color;
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  final PageC = Get.find<PageIndexController>();
  final LoginController _loginController = Get.find();
  final box = GetStorage();
  final userchani = GetStorage();
  final SimpanImage = [
    'assets/slider1.jpg',
    'assets/slider2.jpg',
    'assets/slider3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    void showDialog() {
      Get.defaultDialog(
        title: 'Logout',
        middleText: 'Apakah Anda Yakin Ingin Keluar',
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              controller.logout();
            },
            child: Text('YA'),
          ),
        ],
      );
    }

    void showModalBottomSheet(BuildContext context) {
      Get.bottomSheet(
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person_3),
                title: Text('Detail  Profil'),
                onTap: () => Get.toNamed(Routes.DETAILPROFIL),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Logout'),
                onTap: () {
                  showDialog();
                },
              ),
              // Tambahkan lebih banyak ListTile untuk menu lainnya jika diperlukan
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 146, 109, 209),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 226, 238),
                //     gradient: LinearGradient(
                //   colors: [
                //     Color.fromARGB(255, 160, 51, 233),
                //     Colors.blue[900]!,
                //     Color.fromARGB(255, 255, 255, 255),
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // )
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hai, ${userchani.read('userchan')}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 147, 19, 151),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () {
                        //       showModalBottomSheet(context);
                        //     },
                        //     icon: Icon(Icons.person,
                        //         size: 20, color: Colors.white))
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(context);
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Image.asset('assets/dash/user.png')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Image.asset('assets/icons/car-.png',
                              fit: BoxFit.cover),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // AnimatedTextKit(
                                //   animatedTexts: [
                                //     WavyAnimatedText('E-Supervisi'),
                                //     WavyAnimatedText('Perawat'),
                                //   ],
                                //   isRepeatingAnimation: true,
                                // ),
                                RichText(
                                    text: TextSpan(
                                        text:
                                            'Aplikasi Untuk Mempermudah \n Kegiatan Supervisi pengawas \n dan Survei Penilaian \n Pekerjaan',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () =>
                                    Get.offAllNamed(Routes.HASILSUPERVISI),
                                child: Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(5, 5),
                                            blurRadius: Checkbox.width,
                                            color: Colors.black,
                                          ),
                                        ]),
                                    child: Image.asset(
                                      'assets/dash/filetam.png',
                                    )),
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.TAMPILUPLOAD),
                                child: Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(5, 5),
                                            blurRadius: Checkbox.width,
                                            color: Colors.black,
                                          ),
                                        ]),
                                    child: Image.asset(
                                      'assets/dash/filetam.png',
                                    )),
                              ),
                              SizedBox(width: 15),
                              Container(
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: Checkbox.width,
                                          color: Colors.black,
                                        ),
                                      ]),
                                  child: Image.asset(
                                    'assets/dash/filetam.png',
                                  )),
                              SizedBox(width: 15),
                              SizedBox(width: 15),
                              Container(
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: Checkbox.width,
                                          color: Colors.black,
                                        ),
                                      ]),
                                  child: Image.asset(
                                    'assets/dash/filetam.png',
                                  )),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Color(0xffDDDDE2),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.persent.text),
                                    Text("${controller.persent.text}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/team.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Leader',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 25),
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Get.offAllNamed(
                                                            Routes.UPLOADFILE),
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/upload.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Upload File',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 25),
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Get.offAllNamed(
                                                            Routes.PENILAIAN),
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/article.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Penilaian',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 25),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () => Get.toNamed(
                                                        Routes.SUPERVISI),
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/notepad.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Supervisi',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 25),
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Get.offAllNamed(Routes
                                                            .HASILSUPERVISI),
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/test.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Supervisi',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 25),
                                                Flexible(
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/dash/test.png',
                                                            width: 60,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text('Penilaian',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          activeColor: Color.fromARGB(255, 62, 3, 97),
          color: Colors.deepPurpleAccent[100],
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.note_add, title: 'Penilaian'),
            TabItem(icon: Icons.supervised_user_circle, title: 'Profil'),
            if (_loginController.roleControl.text == 'admin')
              TabItem(icon: Icons.verified_user_sharp, title: 'Tambah'),
          ],
          initialActiveIndex: PageC.pageIndex.value,
          onTap: (int i) => PageC.Changepage(i),
        ));
  }
}

Widget buildImage(String SimpanImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    width: 400,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        SimpanImage,
        fit: BoxFit.cover,
        height: 100,
        width: 350,
      ),
    ));
