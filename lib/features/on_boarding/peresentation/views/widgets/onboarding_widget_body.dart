import 'package:dalel/features/on_boarding/database/model.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class OnboardinWidgetBody extends StatelessWidget {
  final PageController controller;
  final Function(int) onChanged;
  const OnboardinWidgetBody({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: controller,
        itemCount: onboarding.length,
        onPageChanged: onChanged,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 343,
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onboarding[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              smoothPageIndicator(controller: controller),
              SizedBox(
                height: 32,
              ),
              Text(
                textAlign: TextAlign.center,
                onboarding[index].title,
                style: AppTextStyles.poppins500style24,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                textAlign: TextAlign.center,
                onboarding[index].subTitle,
                style: AppTextStyles.poppins500style16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          );
        },
      ),
    );
  }
}
