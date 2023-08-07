import 'package:get/get.dart';

import '../controllers/detailprofil_controller.dart';

class DetailprofilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailprofilController>(
      () => DetailprofilController(),
    );
  }
}
