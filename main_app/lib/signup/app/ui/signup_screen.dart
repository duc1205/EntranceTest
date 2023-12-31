import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:main_app/gen/assets.gen.dart';
import 'package:main_app/injector.dart';
import 'package:main_app/signup/app/controller/signup_controller.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();

    final signupController = Get.find<SignupControler>();

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Assets.resources.images.backgroundCategory.image(fit: BoxFit.fill),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child:  Assets.resources.images.backgroundPage.image(fit: BoxFit.fill),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 60.h, right: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 255.h : 190.h),
                    Text(
                      "Let's get you started!",
                      style: UITextStyle.white22w400,
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 75.h : 40.h),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => signupController.validateEmail(value),
                      controller: signupController.emailController,
                      style: UITextStyle.white16w400,
                      decoration: InputDecoration(
                        labelText: "Your email",
                        labelStyle: UITextStyle.white12w400,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 54.h : 26.h),
                    Obx(
                      () => TextFormField(
                        onChanged: signupController.onChangePass,
                        controller: signupController.passwordController,
                        style: UITextStyle.white16w400,
                        obscureText: signupController.isShowPassWord,
                        decoration: InputDecoration(
                            labelText: "Your password",
                            labelStyle: UITextStyle.white12w400,
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                !signupController.isShowPassWord ? Icons.visibility_off : Icons.visibility,
                                color: UIColor.white.withOpacity(0.5),
                              ),
                              onPressed: signupController.onClickShowPassword,
                            )),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          color: UIColor.incaditor,
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                        ),
                        Obx(
                          () => Container(
                            color: signupController.statePassword.color,
                            width: MediaQuery.of(context).size.width * signupController.statePassword.percent,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          signupController.statePassword.text,
                          style: UITextStyle.white12w400.copyWith(color: signupController.statePassword.color),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 23.h,
                          height: 23.h,
                          child: Obx(
                            () => Checkbox(
                              value: signupController.isCheckboxEnable,
                              checkColor: UIColor.white,
                              focusColor: UIColor.blue,
                              side: BorderSide(color: UIColor.blue1, width: 2.sp),
                              onChanged: signupController.onCheckbox,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "I am over 16 years of age",
                          style: UITextStyle.white14w400,
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    EasyRichText(
                      "By clicking Sign Up, you are indicating that you have read and agree to the Terms of Service and Privacy Policy",
                      defaultStyle: UITextStyle.white12w500,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: "Terms of Service",
                          style: UITextStyle.blue12w500,
                          recognizer: null,
                        ),
                        EasyRichTextPattern(
                          targetString: "Privacy Policy",
                          style: UITextStyle.blue12w500,
                          recognizer: null,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign Up",
                          style: UITextStyle.white16w500,
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              signupController.checkEnableButton() ? signupController.signupApi() : null;
                            },
                            child: signupController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Container(
                                    width: 54.h,
                                    height: 54.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: UIColor.blue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(54.r),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: UIColor.white,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
