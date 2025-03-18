import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({super.key, this.items, required this.controller});

  final List<String>? items;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      fillColor: Colors.white,
      borderSide:const BorderSide(color: Colors.grey),
      hintText: "",
      listItemStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: Colors.black),
      selectedStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16,
          color: Colors.lightGreen),
      items: items,
      hintStyle: getRegularTextStyle(
          fontSize: ManagerFontSize.s16, color: Colors.grey),
      controller: controller,
      borderRadius: BorderRadius.circular(ManagerRadius.r10),
      onChanged: (select) {
        // controller.onChangeLanguage(select);
      },
    );
  }
}
