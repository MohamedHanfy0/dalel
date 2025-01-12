import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class bannerLoginWidget extends StatelessWidget {
  const bannerLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.appName,
            style: AppTextStyles.saira700style32,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.assetsImagesVector1),
              SvgPicture.asset(
                Assets.assetsImagesVector2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
