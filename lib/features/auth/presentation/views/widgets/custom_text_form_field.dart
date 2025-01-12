// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:dalel/core/utils/app_text_styles.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;
  VoidCallback? clickVisibilty;
  bool? isVisibilty;

  CustomTextFormField(
      {super.key,
      required this.onChanged,
      required this.labelText,
      this.clickVisibilty,
      this.isVisibilty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return "This is field required";
          } else {
            return null;
          }
        },
        style: AppTextStyles.poppins400style14,
        obscureText: isVisibilty == false ? true : false,
        decoration: InputDecoration(
          suffixIcon: clickVisibilty == null
              ? null
              : IconButton(
                  onPressed: clickVisibilty,
                  icon: Icon(
                    isVisibilty == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xff999999),
                  )),
          label: Text(labelText),
          labelStyle: AppTextStyles.poppins500style16
              .copyWith(color: Color(0xff6F6460), fontSize: 12),
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0xff0F0D23)));
}
