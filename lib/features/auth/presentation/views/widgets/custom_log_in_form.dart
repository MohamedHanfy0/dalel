import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/views/widgets/text_forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLogInForm extends StatefulWidget {
  const CustomLogInForm({
    super.key,
  });

  @override
  State<CustomLogInForm> createState() => _CustomLogInFormState();
}

class _CustomLogInFormState extends State<CustomLogInForm> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFailerState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.deepBrown,
              content: Text(state.meassage.toString())));
        } else if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/home")
              : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColors.deepBrown,
                  content: Text(" please confirm your email")));
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.logInFormState,
          child: Column(
            spacing: 24,
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                isVisibilty: isVisibility,
                clickVisibilty: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 105),
                  alignment: Alignment.centerRight,
                  child: TextForgotPassword(
                      onTap: () {}, text: AppStrings.forgotPassword)),
              state is SingInLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.deepBrown,
                    )
                  : CustomBottom(
                      bottomColor: AppColors.deepBrown,
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (authCubit.logInFormState.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      }),
            ],
          ),
        );
      },
    );
  }
}
