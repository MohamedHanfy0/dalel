import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgotPassSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please Check Box Your Email.")));
          } else if (state is ForgotPassFailerState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text("Check Your Email ${state.meassage.toString()} ")));
          }
        },
        builder: (context, state) {
          AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 108, bottom: 40),
                        child: WelcomText(text: 'Forgot Password')),
                    Image.asset(
                      Assets.assetsImagesForget,
                      width: 235,
                      height: 235,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 34, right: 34, bottom: 41),
                      child: Text(
                        AppStrings
                            .enterYourRegisterEmailBelowReceivePasswordReset,
                        style: AppTextStyles.poppins400style14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Form(
                      key: authCubit.forgotPassFormState,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 129, right: 42, left: 42),
                            child: CustomTextFormField(
                                onChanged: (email) {
                                  authCubit.emailAddress = email;
                                },
                                labelText: AppStrings.emailAddress),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: state is ForgotPassLoadingState
                                ? CircularProgressIndicator(
                                    color: AppColors.deepBrown,
                                  )
                                : CustomBottom(
                                    bottomColor: AppColors.primaryColor,
                                    text: AppStrings.sendVerificationCode,
                                    onPressed: () async {
                                      if (authCubit
                                          .forgotPassFormState.currentState!
                                          .validate()) {
                                      await  authCubit.forgotPassword();
                                      }
                                    },
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
