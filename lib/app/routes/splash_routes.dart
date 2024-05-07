import 'package:get/get.dart';
import 'package:school_management_teacher/app/modules/splash/splash_page.dart';

import '../modules/splash/splash_binding.dart';

class SplashRoutes {
  SplashRoutes._();

  static const splash = '/';

  static final routes = [
    GetPage(
      name: splash,
  page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
