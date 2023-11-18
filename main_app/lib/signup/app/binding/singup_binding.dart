import 'package:get/get.dart';
import 'package:main_app/signup/app/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupControler>(() => SignupControler());
  }
}
