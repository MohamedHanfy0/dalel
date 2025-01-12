import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CasheHelper>().getData(key: 'onBoardingVisited') ?? false;
    if (isOnBoardingVisited) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, '/SignUp')
          : FirebaseAuth.instance.currentUser!.emailVerified
              ? delayedNavigate(context, '/home')
              : delayedNavigate(context, '/logIn');
    } else {
      delayedNavigate(context, '/onBorading');
    }

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

void delayedNavigate(context, String path) {
  Future.delayed(
    Duration(seconds: 2),
    () {
      customReplacementNavigate(context, path);
    },
  );
}
