import 'package:get/get.dart';

import '../controllers/supervisi_controller.dart';

class SupervisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupervisiController>(
      () => SupervisiController(),
    );
  }
}
