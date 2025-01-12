import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';

class customTerms extends StatelessWidget {
  const customTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: AppStrings.iHaveAgreeToour,
        style: AppTextStyles.poppins400style14
            .copyWith(color: AppColors.deepGrey, fontSize: 12),
      ),
      TextSpan(
          text: AppStrings.termsAndCondition,
          style: AppTextStyles.poppins400style14.copyWith(
              color: AppColors.deepGrey,
              fontSize: 12,
              decoration: TextDecoration.underline)),
    ]));
  }
}
