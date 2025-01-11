
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';

class alreadyHaveAnAccountSignIn extends StatelessWidget {
  VoidCallback onTap;
  alreadyHaveAnAccountSignIn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${AppStrings.alreadyHaveAnAccount}   ',
          style: AppTextStyles.poppins400style14.copyWith(fontSize: 12),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            AppStrings.signIn,
            style: AppTextStyles.poppins400style14
                .copyWith(fontSize: 12, color: Color(0xffB4B4B4)),
          ),
        )
      ],
    );
  }
}
