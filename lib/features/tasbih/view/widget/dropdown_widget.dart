import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/tasbih/controller/tasbih_controller.dart';
import 'package:masajid/features/tasbih/model/tasbih.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key, required this.controller});
  final TasbihController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomDropdown(
        fillColor: Colors.white,
        borderSide: BorderSide(
            color: Colors.grey.shade100),
        hintText: "choose tasbih",
        listItemStyle: getRegularTextStyle(
            fontSize: ManagerFontSize.s16,
            color: Colors.black),
        selectedStyle: getBoldTextStyle(
            fontSize: ManagerFontSize.s18,
            color: ManagerColors.textColor),
        items: controller.isLoading
            ? []
            : controller.item,
        hintStyle: getRegularTextStyle(
            fontSize: ManagerFontSize.s16,
            color: Colors.grey),
        controller:
        controller.dorpDownController,
        borderRadius: BorderRadius.circular(
            ManagerRadius.r10),
        onChanged: (val) {
          var selectedTasbihData =
          controller.tasbih?.firstWhere(
                  (element) =>
              element!.text!.ar == val,
              orElse: () => Tasbih(
                  id: 0,
                  text: TextLang(
                      en: "", ar: ""),
                  pronunciation: "",
                  reference: ""));
          controller.onUpdateData(
              selectedTasbihData!.text!.en,
              selectedTasbihData);
        },
      ),
    );
  }
}
