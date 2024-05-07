import 'home_routes.dart';
import 'splash_routes.dart';
import 'sing_in_routes.dart';
import 'student_class_list_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/';

  static final  routes = [
		...SplashRoutes.routes,
    ...HomeRoutes.routes,
		...SingInRoutes.routes,
		...StudentClassListRoutes.routes,
  ];
}
