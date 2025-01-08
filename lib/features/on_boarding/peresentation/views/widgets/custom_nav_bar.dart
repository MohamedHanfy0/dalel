import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class custom_nav_bar extends StatelessWidget {
  const custom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.skip,
          style: AppTextStyles.poppins500style16,
        ));
  }
}
