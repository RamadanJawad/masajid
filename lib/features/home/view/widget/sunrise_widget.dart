import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class SunriseWidget extends StatelessWidget {
  const SunriseWidget({super.key, required this.sunrise});

  final String sunrise;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h80,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(ManagerRadius.r10),
          border: Border.all(
              color:
              ManagerColors.borderColor)),
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: ManagerHeight.h14,horizontal: ManagerWidth.w16),
        padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w14),
        decoration: BoxDecoration(
          color: ManagerColors.yellowColor,
          borderRadius:
          BorderRadius.circular(ManagerRadius.r10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ManagerColors.white,
              radius: ManagerRadius.r10,
              child: Container(
                width: ManagerWidth.w8,
                height: ManagerHeight.h8,
                decoration: BoxDecoration(
                    color: ManagerColors.yellowColor,
                    borderRadius: BorderRadius.circular(
                        ManagerRadius.r40)),
              ),
            ),
            SizedBox(
              width: ManagerWidth.w10,
            ),
            Text(
              ManagerStrings.sunRise,
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.textColor),
            ),
            const Spacer(),
            Text(
              sunrise,
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}
