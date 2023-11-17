import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:main_app/routers/app_pages.dart';
import 'package:main_app/storage/local_storage.dart';

class SignupControler extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool isLoading = false.obs;

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    MaxLengthValidator(18, errorText: 'password must not exceed 18 digits'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);

  @override
  void onInit() {
    super.onInit();
    SPref.instance.deleteAll();
  }

  void signinApi() async {
    try {
      final response = await http.post(
        Uri.parse("http://streaming.nexlesoft.com:3001/auth/signin"),
        body: {
          "email": emailController.value.text.trim(),
          "password": passwordController.value.text,
        },
      );
      var data = jsonDecode(response.body);

      print("~~~~~~~~~~~ aaa: ${data["accessToken"]}");
      print("~~~~~~~~~~~ bbb: ${data["refreshToken"]}");

      SPref.instance.setAccessToken(data["accessToken"].toString());
      SPref.instance.saveRefreshToken(data["refreshToken"].toString());

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar("Login Successfull", "");
        Get.offAllNamed(Routes.CATEGORIES);
      } else {
        isLoading.value = false;
        Get.snackbar("Login Failed", data["error"]);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }

  void signupApi() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse("http://streaming.nexlesoft.com:3001/api/signup"),
        body: {
          "email": emailController.value.text.trim(),
          "password": passwordController.value.text,
          "firstName": "Nguyen",
          "lastName": "MinhDuc",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.snackbar("Signup Successfull", data["error"]);
        signinApi();
      } else {
        isLoading.value = false;
        Get.snackbar("Signup Failed", data["error"]);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}
