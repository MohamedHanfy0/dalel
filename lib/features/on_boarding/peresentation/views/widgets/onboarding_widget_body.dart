import 'package:dalel/features/on_boarding/database/model.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

class OnboardinWidgetBody extends StatelessWidget {
  OnboardinWidgetBody({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        controller: _controller,
        itemCount: onboarding.length,
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
              smoothPageIndicator(controller: _controller),
              SizedBox(
                height: 32,
              ),
              Text(
                textAlign: TextAlign.center,
                "Explore The history with \n Dalel in a smart way",
                style: AppTextStyles.poppins500style24,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                textAlign: TextAlign.center,
                "Using our app’s history libraries \n you can find many historical periods ",
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
