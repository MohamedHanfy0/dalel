// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dalel/features/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:flutter/material.dart';

import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/views/widgets/alrady_an_account_sign_in.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_text.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 140, bottom: 48),
                alignment: Alignment.center,
                child: WelcomText(text: AppStrings.welcome),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: alreadyHaveAnAccountSignIn(
                  onTap: () {
                    customNavigate(context, '/logIn');
                  },
                  alreadyHaveAnAccount: AppStrings.alreadyHaveAnAccount,
                  signIn: AppStrings.signIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
