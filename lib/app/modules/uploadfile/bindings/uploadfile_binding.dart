import 'package:get/get.dart';

import '../controllers/uploadfile_controller.dart';

class UploadfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadfileController>(
      () => UploadfileController(),
    );
  }
}
