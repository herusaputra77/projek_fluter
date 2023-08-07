import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/supervisi_controller.dart';

class SupervisiView extends GetView<SupervisiController> {
  const SupervisiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.Datakuis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 64, 6, 117)),
                Text(
                  "Mohon Tunggu..",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            return Text("data error");
          } else if (snapshot.hasData) {
            List<dynamic>? kuisdata = snapshot.data;

            return Obx(() {
              if (controller.currentIndex.value >= kuisdata!.length) {
                // Jika currentIndex melebihi jumlah pertanyaan, tampilkan sesuatu
                return Text('Semua pertanyaan telah dijawab');
              }
              if (controller.isQuizFinished.value) {
                Future.delayed(Duration.zero, () {
                  Get.snackbar(
                      'Skor', 'Skor kamu adalah ${controller.score.value}');
                });
                return Container(); // Atau tampilan lain setelah menampilkan skor
              }

              var kuisku = kuisdata[controller.currentIndex.value];

              return ListView(children: [
                Column(
                  children: [
                    Text('Skor: ${controller.score.value}'),
                    Text('${kuisku['pertanyaan']}',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          controller.toggleChecked();
                          controller.selectedValue.value = kuisku['id'];
                          controller.answerQuestion();
                          controller.score.value +=
                              (kuisku['nilai1'] as num).toInt();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: Checkbox.width,
                                    offset: Offset(5, 10),
                                    color: Colors.black26)
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // Menggunakan Row untuk menampilkan tanda centang di samping teks.
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.isChecked.value
                                    //     ? Icon(Icons.check_box,
                                    //         color: Colors
                                    //             .green) // Jika isChecked bernilai true, tampilkan centang hijau.
                                    //     : Icon(Icons
                                    //         .check_box_outline_blank), // Jika isChecked bernilai false, tampilkan kotak kosong.
                                    SizedBox(
                                        width:
                                            16), // Spasi antara tanda centang dan teks.
                                    Text(
                                      'A. ${kuisku['pilihan1']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          controller.selectedValue.value = kuisku['id'];
                          controller.answerQuestion();
                          controller.score.value += controller.score.value +=
                              (kuisku['nilai2'] as num).toInt();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: Checkbox.width,
                                    offset: Offset(5, 10),
                                    color: Colors.black26)
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // Menggunakan Row untuk menampilkan tanda centang di samping teks.
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.isChecked.value
                                    //     ? Icon(Icons.check_box,
                                    //         color: Colors
                                    //             .green) // Jika isChecked bernilai true, tampilkan centang hijau.
                                    //     : Icon(Icons
                                    //         .check_box_outline_blank), // Jika isChecked bernilai false, tampilkan kotak kosong.
                                    SizedBox(
                                        width:
                                            16), // Spasi antara tanda centang dan teks.
                                    Text(
                                      'B. ${kuisku['pilihan2']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          controller.selectedValue.value = kuisku['id'];
                          controller.answerQuestion();
                          controller.score.value +=
                              (kuisku['nilai3'] as num).toInt();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: Checkbox.width,
                                    offset: Offset(5, 10),
                                    color: Colors.black26)
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // Menggunakan Row untuk menampilkan tanda centang di samping teks.
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.isChecked.value
                                    //     ? Icon(Icons.check_box,
                                    //         color: Colors
                                    //             .green) // Jika isChecked bernilai true, tampilkan centang hijau.
                                    //     : Icon(Icons
                                    //         .check_box_outline_blank), // Jika isChecked bernilai false, tampilkan kotak kosong.
                                    SizedBox(
                                        width:
                                            16), // Spasi antara tanda centang dan teks.
                                    Text(
                                      'C. ${kuisku['pilihan3']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          controller.selectedValue.value = kuisku['id'];
                          controller.answerQuestion();
                          controller.score.value +=
                              (kuisku['nilai4'] as num).toInt();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: Checkbox.width,
                                    offset: Offset(5, 10),
                                    color: Colors.black26)
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // Menggunakan Row untuk menampilkan tanda centang di samping teks.
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // controller.isChecked.value
                                    //     ? Icon(Icons.check_box,
                                    //         color: Colors
                                    //             .green) // Jika isChecked bernilai true, tampilkan centang hijau.
                                    //     : Icon(Icons
                                    //         .check_box_outline_blank), // Jika isChecked bernilai false, tampilkan kotak kosong.
                                    SizedBox(
                                        width:
                                            16), // Spasi antara tanda centang dan teks.
                                    Text(
                                      'D. ${kuisku['pilihan4']}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]);
            });
          } else {
            return Text('Belum ada Data');
          }
        },
      ),
    );
  }
}
