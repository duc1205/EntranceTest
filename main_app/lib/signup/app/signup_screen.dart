import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_app/gen/assets.gen.dart';
import 'package:main_app/signup/app/signup_controller.dart';
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

    SignupControler controler = Get.put(SignupControler());

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
                  Assets.resources.images.backgroundImage.image(),
                  Assets.resources.images.backgroundPage.image(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 60, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 255 : 190),
                    Text(
                      "Let's get you started!",
                      style: UITextStyle.white22w400,
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 75 : 40),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => controler.validateEmail(value),
                      controller: controler.emailController,
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
                    SizedBox(height: myFocusNode.hasFocus ? 54 : 26),
                    Obx(
                      () => TextFormField(
                        onChanged: controler.onChangePass,
                        controller: controler.passwordController,
                        style: UITextStyle.white16w400,
                        obscureText: controler.isShowPassWord,
                        decoration: InputDecoration(
                            labelText: "Your password",
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                controler.isShowPassWord ? Icons.visibility_off : Icons.visibility,
                                color: UIColor.white.withOpacity(0.5),
                              ),
                              onPressed: controler.onClickShowPassword,
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
                            color: controler.statePassword.color,
                            width: MediaQuery.of(context).size.width * controler.statePassword.percent,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          controler.statePassword.text,
                          style: UITextStyle.white12w400.copyWith(color: controler.statePassword.color),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        SizedBox(
                          width: 23,
                          height: 23,
                          child: Obx(
                            () => Checkbox(
                              value: controler.isCheckboxEnable,
                              checkColor: UIColor.white,
                              focusColor: UIColor.blue,
                              side: const BorderSide(color: UIColor.white, width: 2),
                              onChanged: controler.onCheckbox,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "I am over 16 years of age",
                          style: UITextStyle.white14w400,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 30),
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
                              controler.checkEnableButton() ? controler.signupApi() : null;
                            },
                            child: controler.isLoading.value
                                ? const CircularProgressIndicator()
                                : Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: UIColor.blue,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(54),
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
