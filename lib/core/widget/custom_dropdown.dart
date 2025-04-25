import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget(
      {super.key,
      this.items,
      required this.controller,
      required this.hintText});

  final List<String>? items;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      fillColor: Colors.white,
      borderSide: BorderSide(color: Colors.grey.shade300),
      hintText: hintText,
      listItemStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: Colors.black),
      selectedStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: Colors.black),
      items: items,
      hintStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: Colors.grey),
      controller: controller,
      borderRadius: BorderRadius.circular(ManagerRadius.r4),
      onChanged: (select) {
        // controller.onChangeLanguage(select);
      },
    );
  }
}
