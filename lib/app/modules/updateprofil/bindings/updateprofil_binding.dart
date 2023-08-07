import 'package:get/get.dart';

import '../controllers/updateprofil_controller.dart';

class UpdateprofilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateprofilController>(
      () => UpdateprofilController(),
    );
  }
}
