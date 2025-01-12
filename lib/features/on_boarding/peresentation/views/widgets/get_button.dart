import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/on_boarding/database/model.dart';
import 'package:dalel/features/on_boarding/peresentation/views/functions/on_boarding.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final currentIndex;
  PageController pageController;
  GetButton({super.key, this.currentIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    if (currentIndex == onboarding.length - 1) {
      return Column(
        children: [
          CustomBottom(
            text: AppStrings.createAccount,
            onPressed: () {
              onBoardingVisited();
              customReplacementNavigate(context, '/SignUp');
            },
            bottomColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              onBoardingVisited();
              customReplacementNavigate(context, '/logIn');
            },
            child: Text(
              AppStrings.loginNow,
              style: AppTextStyles.poppins500style16,
            ),
          )
        ],
      );
    } else {
      return CustomBottom(
        text: AppStrings.next,
        onPressed: () {
          pageController.nextPage(
              duration: Duration(microseconds: 200), curve: Curves.bounceIn);
        },
        bottomColor: AppColors.primaryColor,
      );
    }
  }
}
