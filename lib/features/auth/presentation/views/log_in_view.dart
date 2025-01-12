// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/features/auth/presentation/widgets/alrady_an_account_sign_in.dart';
import 'package:flutter/material.dart';

import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/widgets/banner_log_in.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_log_in_form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  bool isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: bannerLoginWidget(),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(top: 32, bottom: 48),
                alignment: Alignment.center,
                child: WelcomText(text: AppStrings.welcomeBack)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomLogInForm(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 74),
              child: alreadyHaveAnAccountSignIn(
                  onTap: () {
                    customReplacementNavigate(context, '/SignUp');
                  },
                  alreadyHaveAnAccount: AppStrings.dontHaveAnAccount,
                  signIn: AppStrings.signUp),
            ),
          )
        ],
      ),
    );
  }
}
