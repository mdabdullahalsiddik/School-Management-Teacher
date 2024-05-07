import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:school_management_teacher/app/routes/home_routes.dart';
import 'package:school_management_teacher/app/routes/sing_in_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    time();
    super.onInit();
  }

  void time() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      FirebaseAuth.instance.currentUser == null
          ? Get.offAllNamed(SingInRoutes.singIn)
          : Get.offAllNamed(HomeRoutes.home);
    });
  }
}