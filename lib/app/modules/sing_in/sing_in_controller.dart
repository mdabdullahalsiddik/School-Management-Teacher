import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management_teacher/app/routes/home_routes.dart';

class SingInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var forky = GlobalKey<FormState>();
  var passwordValidator = true.obs;
  singIn() async {
    if (forky.currentState!.validate()) {
      if (passwordController.text.length >= 6) {
        if (RegExp(r"^[a-zA-Z0-9,]+@[teacher,]+.[a-zA-Z]")
            .hasMatch(emailController.text)) {
          try {
            await EasyLoading.show(status: 'loading...');

            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
                .then((value) {
              Get.offAllNamed(HomeRoutes.home);
              EasyLoading.showSuccess('Success');
              EasyLoading.dismiss();
            });
          } catch (e) {
            Get.snackbar("Error", "$e");
            EasyLoading.showError('Error');
            EasyLoading.dismiss();
          }
        } else {
          Get.snackbar("Error", "Email is not valid");
        }
      } else {
        Get.snackbar("Error", "Password must be at least 6 characters");
      }
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }

  setPasswordValidator() {
    passwordValidator.value = !passwordValidator.value;
  }
}
