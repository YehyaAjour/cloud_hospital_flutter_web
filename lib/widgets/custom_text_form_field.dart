
import 'package:flutter/material.dart';

import '../constants/style.dart';
import 'custom_text.dart';




class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
  final bool isPassword;
  final int maxLines;
  final IconData suffixIcon;
  CustomTextFormField({
    this.label,
    this.hint,
    this.onSaved,
    this.validator,
    this.textInputType,
    this.isPassword = false,
    this.maxLines,
    this.suffixIcon
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) => onSaved(value),
      validator: (newValue) => validator(newValue),
      obscureText: isPassword,
      maxLines: maxLines??1,
      minLines: 1,
      keyboardType: textInputType ?? TextInputType.text,
      // initialValue: hint ?? "",
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
        ),
      ),
      style: TextStyle(fontSize: 15,height: 2.5),

    );
  }
}
