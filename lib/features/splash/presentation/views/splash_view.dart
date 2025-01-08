import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigate(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}


  void delayedNavigate(context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        CustomNavigate(context, '/onBorading');
      },
    );
  }
