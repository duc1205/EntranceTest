import 'package:get/get.dart';
import 'package:main_app/category/app/ui/category_screen.dart';
import 'package:main_app/home/app/home_screen.dart';
import 'package:main_app/signup/app/signup_screen.dart';
part 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.singnUp,
      page: () => const SignupScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.categories,
      page: () => const CategoryScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
