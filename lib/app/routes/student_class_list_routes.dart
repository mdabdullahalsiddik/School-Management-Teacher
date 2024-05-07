import 'package:get/get.dart';

import '../modules/student_class_list/student_class_list_binding.dart';
import '../modules/student_class_list/student_class_list_page.dart';

class StudentClassListRoutes {
  StudentClassListRoutes._();

  static const studentClassList = '/student-class-list';

  static final routes = [
    GetPage(
      name: studentClassList,
      page: () => const StudentClassListPage(),
      binding: StudentClassListBinding(),
    ),
  ];
}
