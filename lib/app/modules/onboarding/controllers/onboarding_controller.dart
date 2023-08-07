import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_kemenkes/app/routes/app_pages.dart';

import '../../../../models/onbormodel.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  var selectedPageIndex = 0.obs;
  bool get isLatPage => selectedPageIndex.value == onboardingpage.length - 1;
  var pagecont = PageController();

  lanjutaksi() {
    if (isLatPage) {
      Get.toNamed(Routes.LOGIN);
    } else {
      pagecont.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<onboardingInfo> onboardingpage = [
    onboardingInfo('assets/onbo/1.png', 'Apa itu E-Supervisi',
        'E-SUpervisi Merupakan Aplikasi kegiatan pengawasan dan pembinaan yang dilakukan secara berkesinambungan oleh supervisor mencakup masalah pelayanan keperawatan'),
    onboardingInfo('assets/onbo/2.png', 'Keuntungan E-SUpervisi',
        'E-SUpervisi Merupakan Aplikasi kegiatan pengawasan dan pembinaan yang dilakukan secara berkesinambungan oleh supervisor mencakup masalah pelayanan keperawatan'),
    onboardingInfo('assets/onbo/3.png', 'Untuk Melihat Pelayanan',
        'E-SUpervisi Merupakan Aplikasi kegiatan pengawasan dan pembinaan yang dilakukan secara berkesinambungan oleh supervisor mencakup masalah pelayanan keperawatan'),
  ];
}
