import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hasilsupervisi_controller.dart';

class HasilsupervisiView extends GetView<HasilsupervisiController> {
  const HasilsupervisiView({Key? key}) : super(key: key);
  @override
  void _showResponseDetailModal(BuildContext context, dynamic response) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nama User: ${response['nama_user']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Nilai: ${response['nilai']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            color: Colors.deepPurple,
            height: 120,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Data Hasil Supervisi",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: controller.Tampilhasil(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else {
                List<dynamic>? data = snapshot.data;
                return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                _showResponseDetailModal(context, data[index]),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors
                                    .white, // Set the background color of the ListTile
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.5), // Color of the shadow
                                    spreadRadius:
                                        2, // Spread radius of the shadow
                                    blurRadius: 5, // Blur radius of the shadow
                                    offset:
                                        Offset(0, 3), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(data[index]['nama_user']),
                                    subtitle: Text(data[index]['nilai']),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Divider()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            })));
  }
}
