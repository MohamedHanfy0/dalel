
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class smoothPageIndicator extends StatelessWidget {
  const smoothPageIndicator({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _controller, // PageController
      count: 3,
      effect: ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 10,
          activeDotColor:
              AppColors.deepBrown), // your preferred effect
    
      // onDotClicked: (index) {},
    );
  }
}
