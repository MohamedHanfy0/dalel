import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final ValueChanged<bool?>? onChanged;
  final bool isCheck;
  const CustomCheckBox(
      {super.key, required this.onChanged, required this.isCheck});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.primaryColor,
      side: BorderSide(width: 1),
      value: widget.isCheck,
      onChanged: widget.onChanged,
    );
  }
}
