import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

Widget textField({
  bool? obSecure,
  required TextEditingController controller,
  required String hintText,
  validator,
  Widget? suffixIcon,
  Widget? prefixIcon,
  void Function()? onTap,
  onChange,
  TextInputType? textInputType,
  FocusNode? focusNode,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    cursorColor: ManagerColors.colorOneGradient,
    cursorErrorColor: ManagerColors.colorOneGradient,
    keyboardType: textInputType,
    onTap: onTap,
    focusNode: focusNode,
    style: getRegularTextStyle(
        fontSize: ManagerFontSize.s14, color: ManagerColors.black),
    onChanged: onChange ?? (val) {},
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s13, color: ManagerColors.grey),
      contentPadding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h14,
        horizontal: ManagerWidth.w10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: BorderSide(
          color: ManagerColors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: BorderSide(
          color: ManagerColors.grey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: BorderSide(
          color: ManagerColors.grey,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: BorderSide(
          color: ManagerColors.grey,
        ),
      ),
      filled: true,
      errorStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s9,
        color: Colors.red,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: ManagerColors.white,
    ),
  );
}
