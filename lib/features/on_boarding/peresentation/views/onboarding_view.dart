import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/on_boarding/database/model.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/get_button.dart';
import 'package:dalel/features/on_boarding/peresentation/views/widgets/onboarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

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
            custom_nav_bar(
              onTap: () {
                CustomNavigate(context, '/SignUp');
              },
            ),
            OnboardinWidgetBody(
              controller: _pageController,
              onChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
            SizedBox(
              height: 88,
            ),
            GetButton(pageController: _pageController,currentIndex: currentIndex,), 
            SizedBox(
              height: 17,
            )
          ],
        ),
      ),
    );
  }
}
