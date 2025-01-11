import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottom extends StatelessWidget {
  CustomBottom({super.key, required this.text, this.bottomColor,  this.onPressed});
  String text;
  Color? bottomColor;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bottomColor ?? AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.poppins500style16
              .copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
