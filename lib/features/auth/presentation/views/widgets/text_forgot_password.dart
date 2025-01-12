import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForgotPassword extends StatelessWidget {
  VoidCallback onTap;
  String text;
  TextForgotPassword({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyles.poppins600style28
            .copyWith(fontSize: 12, color: Color(0xff6F6460)),
      ),
    );
  }
}
