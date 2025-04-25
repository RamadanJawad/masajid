import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/home/view/widget/menu_widget.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.currentPrayName,
    required this.currentPrayTime,
  });

  final String currentPrayName;
  final String currentPrayTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ManagerAssets.mosque,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: ManagerWidth.w10,
            right: ManagerWidth.w10,
            top: ManagerHeight.h36,
            bottom: ManagerHeight.h30),
        child: Column(
          children: [
            SizedBox(
              height: ManagerHeight.h10,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Visibility(
                    visible: HijriCalendar.now().longMonthName == "Ramadan"
                        ? true
                        : false,
                    child: Row(
                      children: [
                        Text(
                          "Suhur : 4:14 AM",
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s13,
                              color: ManagerColors.white),
                        ),
                        VerticalDivider(
                          color: ManagerColors.yellowColor,
                          width: ManagerWidth.w10,
                          thickness: 1,
                        ),
                        Text(
                          "Iftar : 5:14pm",
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s13,
                              color: ManagerColors.white),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const MenuWidget();
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: ManagerColors.white,
                      radius: ManagerRadius.r20,
                      child: SvgPicture.asset(ManagerAssets.category),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h6,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    "Now : ",
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s26,
                        color: ManagerColors.white),
                  ),
                  Text(
                    currentPrayName,
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s26,
                        color: ManagerColors.white),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  currentPrayTime,
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s24,
                      color: ManagerColors.white),
                ),
                Text(
                  " (Start time)",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  DateFormat('d MMMM, y').format(DateTime.now()),
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12,
                    color: ManagerColors.white,
                  ),
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                SvgPicture.asset(
                  ManagerAssets.calender1,
                  width: ManagerWidth.w18,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
              ],
            ),
            SizedBox(
              height: ManagerHeight.h6,
            ),
            Row(
              children: [
                Text(
                  "1 hour 50 min left",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  "${HijriCalendar.now().longMonthName} | ${HijriCalendar.now().hDay}, ${HijriCalendar.now().hYear} AH ",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.white),
                ),
                SvgPicture.asset(
                  ManagerAssets.calender2,
                  width: ManagerWidth.w18,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
