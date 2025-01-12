import 'package:dalel/core/function/custom_navigate.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/custom_bottom.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_terms.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.deepBrown,
              content: Text("Your account has been created successfully – please confirm your email")));
          customReplacementNavigate(context, '/logIn');
        } else if (state is SignupFailerState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.deepBrown,
              content: Text(state.meassage.toString())));
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.singUpFormState,
          child: Column(
            spacing: 24,
            children: [
              CustomTextFormField(
                labelText: AppStrings.firstName,
                onChanged: (firstName) {
                  //  BlocProvider<AuthCubit>(create: (context) => ,)
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
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
              Row(
                children: [
                  CustomCheckBox(),
                  customTerms(),
                ],
              ),
              SizedBox(
                height: 55,
              ),
              state is SignupLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.deepBrown,
                    )
                  : CustomBottom(
                      bottomColor:
                          authCubit.termsAndConditionCheckBoxValue == false
                              ? AppColors.grey
                              : AppColors.deepBrown,
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (authCubit.termsAndConditionCheckBoxValue == true) {
                          if (authCubit.singUpFormState.currentState!
                              .validate()) {
                            authCubit.signUpWithEmailAndPassword();
                          }
                        }
                      }),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
