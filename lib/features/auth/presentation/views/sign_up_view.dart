// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/auth/presentation/views/widgets/alrady_an_account_sign_in.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_terms.dart';
import 'package:flutter/material.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_field.dart';
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
                margin: EdgeInsets.only(top: 152, bottom: 48),
                alignment: Alignment.center,
                child: WelcomText(text: AppStrings.welcome),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                spacing: 24,
                children: [
                  CustomTextField(
                    labelText: AppStrings.firstName,
                  ),
                  CustomTextField(
                    labelText: AppStrings.lastName,
                  ),
                  CustomTextField(
                    labelText: AppStrings.emailAddress,
                  ),
                  CustomTextField(
                    labelText: AppStrings.password,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  CustomCheckBox(
                    isCheck: isCheckBox,
                    onChanged: (value) {
                      setState(() {
                        isCheckBox = value!;
                      });
                    },
                  ),
                  customTerms()
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 88,
                  ),
                  CustomBottom(text: AppStrings.signUp, onPressed: () {}),
                  SizedBox(
                    height: 16,
                  ),
                  alreadyHaveAnAccountSignIn(
                    onTap: () {
                      CustomNavigate(context, '/logIn');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
