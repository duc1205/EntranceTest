import 'package:flutter/material.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome .....',
          style: UITextStyle.white_22_w400.copyWith(color: UIColor.blue),
        ),
      ),
    );
  }
}
