import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ManagerAssets.mosque),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
        child: Column(
          children: [
            SizedBox(
              height: ManagerHeight.h10,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    "Suhur : ",
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                  Text(
                    "4:14 AM",
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                  VerticalDivider(
                    color: ManagerColors.yellowColor,
                    width: ManagerWidth.w10,
                    thickness: 1,
                  ),
                  Text(
                    "Iftar : ",
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                  Text(
                    "4:14 PM",
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const MenuWidget(
                          );
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
              height: ManagerHeight.h10,
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    "Now : ",
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s30,
                        color: ManagerColors.white),
                  ),
                  Text(
                    "Duhur",
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s30,
                        color: ManagerColors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Row(
              children: [
                Text(
                  "${DateFormat('hh:mm').format(DateTime.now())} ",
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s30,
                      color: ManagerColors.white),
                ),
                Text(
                  "(Start time)",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  "${DateFormat('dd').format(DateTime.now())} ${DateFormat('MMM').format(DateTime.now())}, ${DateFormat('yyyy').format(DateTime.now())}",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                SvgPicture.asset(
                  ManagerAssets.calender1,
                  width: ManagerWidth.w20,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
              ],
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Row(
              children: [
                Text(
                  "1 hour 50 min left",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  "${HijriCalendar.now().longMonthName} | ${HijriCalendar.now().hDay} , ${HijriCalendar.now().hYear} ",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
                ),
                SvgPicture.asset(
                  ManagerAssets.calender2,
                  width: ManagerWidth.w20,
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
              ],
            ),
            SizedBox(
              height: ManagerHeight.h10,
            ),
          ],
        ),
      ),
    );
  }
}
