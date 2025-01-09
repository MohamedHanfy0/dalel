import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class custom_nav_bar extends StatelessWidget {
 final VoidCallback onTap;
  const custom_nav_bar({
    super.key,
    required
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.poppins500style16,
          ),
        ));
  }
}
