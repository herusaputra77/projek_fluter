import 'package:get/get.dart';

import '../modules/detailprofil/bindings/detailprofil_binding.dart';
import '../modules/detailprofil/views/detailprofil_view.dart';
import '../modules/hasilsupervisi/bindings/hasilsupervisi_binding.dart';
import '../modules/hasilsupervisi/views/hasilsupervisi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/penilaian/bindings/penilaian_binding.dart';
import '../modules/penilaian/views/penilaian_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/supervisi/bindings/supervisi_binding.dart';
import '../modules/supervisi/views/supervisi_view.dart';
import '../modules/tampilupload/bindings/tampilupload_binding.dart';
import '../modules/tampilupload/views/tampilupload_view.dart';
import '../modules/updateprofil/bindings/updateprofil_binding.dart';
import '../modules/updateprofil/views/updateprofil_view.dart';
import '../modules/uploadfile/bindings/uploadfile_binding.dart';
import '../modules/uploadfile/views/uploadfile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PENILAIAN,
      page: () => PenilaianView(),
      binding: PenilaianBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.UPDATEPROFIL,
      page: () => UpdateprofilView(),
      binding: UpdateprofilBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPROFIL,
      page: () => DetailprofilView(),
      binding: DetailprofilBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.UPLOADFILE,
      page: () => UploadfileView(),
      binding: UploadfileBinding(),
    ),
    GetPage(
      name: _Paths.SUPERVISI,
      page: () => const SupervisiView(),
      binding: SupervisiBinding(),
    ),
    GetPage(
      name: _Paths.HASILSUPERVISI,
      page: () => const HasilsupervisiView(),
      binding: HasilsupervisiBinding(),
    ),
    GetPage(
      name: _Paths.TAMPILUPLOAD,
      page: () => const TampiluploadView(),
      binding: TampiluploadBinding(),
    ),
  ];
}
