import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app/service/api_exception.dart';
import 'package:main_app/service/api_service.dart';
import 'package:main_app/enum/enum_password.dart';
import 'package:main_app/routers/app_pages.dart';
import 'package:main_app/storage/local_storage.dart';

class SignupControler extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService _apiService = ApiService();

  RxBool isLoading = false.obs;

  final _isShowPassword = false.obs;
  bool get isShowPassWord => _isShowPassword.value;

  final _isCheckboxEnable = false.obs;
  bool get isCheckboxEnable => _isCheckboxEnable.value;

  final _statePassword = Rx<PasswordStrength>(PasswordStrength.none);
  PasswordStrength get statePassword => _statePassword.value;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onClickShowPassword() {
    _isShowPassword.value = !isShowPassWord;
  }

  void onCheckbox(bool? value) {
    if (value != null) {
      _isCheckboxEnable.value = !isCheckboxEnable;
    }
  }

  void onChangePass(String value) {
    if (value.length < 6) {
      _statePassword.value = PasswordStrength.tooShort;
      return;
    }

    if (value.length > 18) {
      _statePassword.value = PasswordStrength.tooLong;
      return;
    }

    final regexUpCase = RegExp(r'[A-Z]');
    final regexLowerCase = RegExp(r'[a-z]');
    final regexNumberic = RegExp(r'[0-9]');
    final regexCharactic = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    bool hasMatch1 = regexUpCase.hasMatch(value) && regexLowerCase.hasMatch(value);
    bool hasMatch2 = regexNumberic.hasMatch(value);
    bool hasMatch3 = regexCharactic.hasMatch(value);

    int countMatch = 0;
    if (hasMatch1) {
      countMatch += 1;
    }
    if (hasMatch2) {
      countMatch += 1;
    }
    if (hasMatch3) {
      countMatch += 1;
    }
    switch (countMatch) {
      case 1:
        _statePassword.value = PasswordStrength.fair;
        return;
      case 2:
        _statePassword.value = PasswordStrength.good;
        return;
      case 3:
        _statePassword.value = PasswordStrength.strong;
        return;
      default:
        _statePassword.value = PasswordStrength.weak;
        return;
    }
  }

  bool checkEnableButton() {
    if (emailController.text.isEmail &&
        statePassword != PasswordStrength.tooShort &&
        statePassword != PasswordStrength.none &&
        statePassword != PasswordStrength.tooLong) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? value) {
    if (value == null) return null;
    if (!value.isEmail) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    SPref.instance.deleteAll();
  }

  void signinApi() async {
    try {
      final response = await _apiService.post(
        '/auth/signin',
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        SPref.instance.setAccessToken(response.data["accessToken"].toString());
        SPref.instance.saveRefreshToken(response.data["refreshToken"].toString());
        Get.offAllNamed(Routes.categories);
      } else {
        isLoading.value = false;
        Get.snackbar("Login Failed", response.data["error"]);
      }
    } on DioException catch (e) {
      isLoading.value = false;
      final ApiException apiException = ApiException.fromDioError(e);
      Get.snackbar("Exception", apiException.toString());
    }
  }

  void signupApi() async {
    isLoading.value = true;
    try {
      final response = await _apiService.post(
        '/auth/signup',
        data: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
          "firstName": "Nguyen",
          "lastName": "MinhDuc",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        signinApi();
      } else {
        isLoading.value = false;
      }
    } on DioException catch (e) {
      isLoading.value = false;
      final ApiException apiException = ApiException.fromDioError(e);
      Get.snackbar("Signup Failed", apiException.toString());
    }
  }
}
