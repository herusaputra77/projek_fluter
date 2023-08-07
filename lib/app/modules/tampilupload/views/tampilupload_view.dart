import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tampilupload_controller.dart';

class TampiluploadView extends GetView<TampiluploadController> {
  const TampiluploadView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TampiluploadView'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.Tampilhasilfile(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snap.hasError) {
                return Text('${snap.error}');
              } else {
                List<dynamic>? data = snap.data;
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text('${data[index]["username"]}'),
                          ElevatedButton(
                              onPressed: () {
                                String originalFileName =
                                    "${data[index]["nama_file"]}";
                                String cleanedFileName =
                                    originalFileName.replaceAll("\\", "");
                                final filename = cleanedFileName;
                                controller.downloadFile(filename);
                              },
                              child: Text('Download File'))
                        ],
                      );
                    });
              }
            }));
  }
}
