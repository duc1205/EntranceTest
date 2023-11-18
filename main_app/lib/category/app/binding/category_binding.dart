import 'package:get/get.dart';
import 'package:main_app/category/app/controller/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryControler>(() => CategoryControler());
  }
}
