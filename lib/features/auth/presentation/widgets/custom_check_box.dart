import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.primaryColor,
      side: BorderSide(width: 1),
      value: isCheck,
      onChanged: (newValue) {
        setState(() {
          isCheck = newValue;
          BlocProvider.of<AuthCubit>(context)
              .updateConditionCheckBoxValue(newValue: newValue);
        });
      },
    );
  }
}
