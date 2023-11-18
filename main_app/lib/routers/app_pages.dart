import 'package:get/get.dart';
import 'package:main_app/category/app/binding/category_binding.dart';
import 'package:main_app/category/app/ui/category_screen.dart';
import 'package:main_app/home/app/home_screen.dart';
import 'package:main_app/signup/app/ui/signup_screen.dart';
import 'package:main_app/signup/app/binding/singup_binding.dart';
part 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.singnUp,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.categories,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
