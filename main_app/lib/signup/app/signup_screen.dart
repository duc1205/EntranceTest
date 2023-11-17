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
    bool passwordVisible = false;

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
                      style: UITextStyle.white_22_w400,
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 75 : 40),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        validator: (value) => controler.validateEmail(value),
                        controller: controler.emailController.value,
                        style: UITextStyle.white_16_w400,
                        decoration: InputDecoration(
                          labelText: "Your email",
                          labelStyle: UITextStyle.white_12_w400,
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
                    ),
                    SizedBox(height: myFocusNode.hasFocus ? 54 : 26),
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        // validator: controler.passwordValidator,
                        // onChanged: (value) => controler.passwordController.value.text = value,
                        controller: controler.passwordController.value,
                        style: UITextStyle.white_16_w400,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                            labelText: "Your password",
                            labelStyle: UITextStyle.white_12_w400,
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
                                passwordVisible ? Icons.visibility_off : Icons.visibility,
                                color: UIColor.white.withOpacity(0.5),
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        SizedBox(
                          width: 23,
                          height: 23,
                          child: Checkbox(
                            value: true,
                            checkColor: UIColor.white,
                            focusColor: UIColor.blue,
                            onChanged: ((value) {}),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "I am over 16 years of age",
                          style: UITextStyle.white_14_w400,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    EasyRichText(
                      "By clicking Sign Up, you are indicating that you have read and agree to the Terms of Service and Privacy Policy",
                      defaultStyle: UITextStyle.white_12_w500,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: "Terms of Service",
                          style: UITextStyle.blue_12_w500,
                          // recognizer: TapGestureRecognizer()..onTap = viewModel.launchTermsAndConditionsUrl,
                        ),
                        EasyRichTextPattern(
                          targetString: "Privacy Policy",
                          style: UITextStyle.blue_12_w500,
                          // recognizer: TapGestureRecognizer()..onTap = viewModel.launchTermsAndConditionsUrl,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Sign Up",
                            style: UITextStyle.white_16_w500,
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controler.signinApi();
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
