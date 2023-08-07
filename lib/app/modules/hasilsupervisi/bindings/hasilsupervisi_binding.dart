import 'package:get/get.dart';

import '../controllers/hasilsupervisi_controller.dart';

class HasilsupervisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilsupervisiController>(
      () => HasilsupervisiController(),
    );
  }
}
