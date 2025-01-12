

import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomText extends StatelessWidget {
  final String text;
  const WelcomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.poppins600style28,
    );
  }
}
