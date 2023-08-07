import 'package:get/get.dart';
import 'package:projek_kemenkes/app/routes/app_pages.dart';

class PageIndexController extends GetxController {
  //TODO: Implement PageIndexController
  RxInt pageIndex = 0.obs;

  void Changepage(int i) async {
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.UPLOADFILE);
        break;
      case 2:
        Get.offAllNamed(Routes.DETAILPROFIL);
        break;
      case 4:
        Get.offAllNamed(Routes.REGISTER);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }
}
