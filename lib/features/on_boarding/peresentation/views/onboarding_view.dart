import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/onboarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            custom_nav_bar(),
            OnboardinWidgetBody(),
            SizedBox(
              height: 88,
            ),
            CustomBottom(text: AppStrings.next),
            SizedBox(
              height: 17,
            )
          ],
        ),
      ),
    );
  }
}
