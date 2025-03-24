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
      height: ManagerHeight.h70,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(ManagerRadius.r10),
          border: Border.all(
              color:
              ManagerColors.grey.withOpacity(0.3))),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10),
        decoration: BoxDecoration(
          color: ManagerColors.yellowColor,
          borderRadius:
          BorderRadius.circular(ManagerRadius.r10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ManagerColors.white,
              radius: ManagerRadius.r14,
              child: Container(
                width: ManagerWidth.w10,
                height: ManagerHeight.h10,
                decoration: BoxDecoration(
                    color: ManagerColors.yellowColor,
                    borderRadius: BorderRadius.circular(
                        ManagerRadius.r50)),
              ),
            ),
            SizedBox(
              width: ManagerWidth.w10,
            ),
            Text(
              ManagerStrings.sunRise,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s20,
                  color: ManagerColors.textColor),
            ),
            const Spacer(),
            Text(
              sunrise,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s20,
                  color: ManagerColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}
