import 'package:flutter/material.dart';
import 'package:main_app/themes/ui_color.dart';
import 'package:main_app/themes/ui_text_style.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please wait...",
            style: UITextStyle.white_16_w400,
          ),
          const SizedBox(
            width: 8,
          ),
          const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(UIColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
