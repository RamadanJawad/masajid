import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class FridayWidget extends StatelessWidget {
  const FridayWidget({super.key, required this.fridayPrayersTime});

  final String fridayPrayersTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
          border: Border.all(color: ManagerColors.borderColor)),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: ManagerHeight.h14, horizontal: ManagerWidth.w16),
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w14),
        decoration: BoxDecoration(
          color: ManagerColors.iconColor,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(ManagerAssets.aljumaaa),
            SizedBox(
              width: ManagerWidth.w4,
            ),
            Text(
              ManagerStrings.fridayPrayers,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16, color: Colors.black),
            ),
            const Spacer(),
            Text(
              fridayPrayersTime,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16, color: Colors.black),
            ),
            SizedBox(
              width: ManagerWidth.w4,
            ),
          ],
        ),
      ),
    );
  }
}
