import 'package:get/get.dart';

import 'student_class_list_controller.dart';

class StudentClassListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentClassListController>(
      () => StudentClassListController(),
    );
  }
}
