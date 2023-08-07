import 'package:get/get.dart';

import '../controllers/tampilupload_controller.dart';

class TampiluploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TampiluploadController>(
      () => TampiluploadController(),
    );
  }
}
