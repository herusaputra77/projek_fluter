import 'package:get/get.dart';

import '../controllers/penilaian_controller.dart';

class PenilaianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenilaianController>(
      () => PenilaianController(),
    );
  }
}
