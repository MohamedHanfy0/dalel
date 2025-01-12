// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dalel/core/utils/app_text_styles.dart';

class alreadyHaveAnAccountSignIn extends StatelessWidget {
  VoidCallback onTap;
  String alreadyHaveAnAccount;
  String signIn;
  alreadyHaveAnAccountSignIn({
    super.key,
    required this.onTap,
    required this.alreadyHaveAnAccount,
    required this.signIn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$alreadyHaveAnAccount   ',
          style: AppTextStyles.poppins400style14.copyWith(fontSize: 12),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            signIn,
            style: AppTextStyles.poppins400style14
                .copyWith(fontSize: 12, color: Color(0xffB4B4B4)),
          ),
        )
      ],
    );
  }
}
