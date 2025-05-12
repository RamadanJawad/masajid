import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class FridayWidget extends StatelessWidget {
  const FridayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r10),
        border: Border.all(color: ManagerColors.borderColor),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ManagerHeight.h14, horizontal: ManagerWidth.w16),
        decoration: BoxDecoration(
          color: ManagerColors.iconColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(ManagerAssets.aljumaaa),
            SizedBox(width: ManagerWidth.w8),
            Text(
              ManagerStrings.fridayPrayers,
              style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}