import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/contactUs/view/screen/contact.dart';
import 'package:masajid/features/home/controller/home_controller.dart';

class WidgetStack extends StatelessWidget {
  WidgetStack(
      {Key? key, required this.name, this.visible, this.inflVisible = false})
      : super(key: key);

  final String name;
  final bool? visible;
  bool inflVisible;
  final controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ManagerAssets.mosque),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
        child: Column(
          children: [
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Row(
              children: [
                Visibility(
                  visible: visible ?? true,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: ManagerColors.white,
                        size: ManagerIconSize.s30,
                      )),
                ),
                Text(
                  name,
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s30,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Visibility(
                  visible: inflVisible,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => ContactScreen());
                      },
                      icon: Icon(
                        Icons.info,
                        color: ManagerColors.white,
                        size: ManagerIconSize.s30,
                      )),
                ),
              ],
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
                        fontSize: ManagerFontSize.s22,
                        color: ManagerColors.white),
                  ),
                  Text(
                    controller.currentPray!,
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s22,
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
                  DateFormat('hh:mm').format(DateTime.now()),
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s22,
                      color: ManagerColors.white),
                ),
                Text(
                  "(start time)",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  DateFormat('d MMMM, y').format(DateTime.now()),
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s13,
                      color: ManagerColors.white),
                ),
                SizedBox(
                  width: ManagerWidth.w4,
                ),
                SvgPicture.asset(
                  ManagerAssets.calender1,
                  width: ManagerWidth.w20,
                )
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
                      fontSize: ManagerFontSize.s13,
                      color: ManagerColors.white),
                ),
                const Spacer(),
                Text(
                  "${HijriCalendar.now().longMonthName} | ${HijriCalendar.now().hDay}, ${HijriCalendar.now().hYear} AH ",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s13,
                      color: ManagerColors.white),
                ),
                SvgPicture.asset(
                  ManagerAssets.calender2,
                  width: ManagerWidth.w20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
