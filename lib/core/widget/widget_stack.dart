import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class WidgetStack extends StatelessWidget {
  const WidgetStack({Key? key, required this.name, this.visible})
      : super(key: key);

  final String name;
  final bool? visible;

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
                        Navigator.of(context).pop();
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
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.white),
                  ),
                  Text(
                    "Duhur",
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s18,
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
                      fontSize: ManagerFontSize.s16,
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
                  "${DateFormat('dd').format(DateTime.now())} ${DateFormat('MMM').format(DateTime.now())}, ${DateFormat('yyyy').format(DateTime.now())} ",
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
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
                      fontSize: ManagerFontSize.s15,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
