import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class CustomPrayTime extends StatelessWidget {
  const CustomPrayTime({
    Key? key,
    required this.salahName,
    required this.salahBegin,
    required this.salahIqaamah,
    required this.isCurrent,
  }) : super(key: key);

  final String salahName;
  final String salahBegin;
  final String salahIqaamah;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ManagerHeight.h54,
      margin: EdgeInsets.only(bottom: ManagerHeight.h16),
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
      decoration: BoxDecoration(
          boxShadow: isCurrent
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
          color:
              isCurrent ? ManagerColors.colorTwoGradient : Colors.transparent,
          borderRadius: BorderRadius.circular(ManagerRadius.r10),
          border: Border.all(color: ManagerColors.grey.withOpacity(0.3))),
      child: Row(
        children: [
          SizedBox(
            width: ManagerWidth.w4,
          ),
          SvgPicture.asset(ManagerAssets.time),
          SizedBox(
            width: ManagerWidth.w4,
          ),
          Text(
            salahName,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: isCurrent ? ManagerColors.white : Colors.black),
          ),
          const Spacer(),
          Text(
            salahBegin,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: isCurrent ? ManagerColors.white : Colors.black),
          ),
          const Spacer(),
          Text(
            salahIqaamah,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: isCurrent ? ManagerColors.white : Colors.black),
          ),
          // const Spacer(),
          // IconButton(
          //   icon: Icon(
          //     isNotificationEnabled ? Icons.notifications_active : Icons.notifications_off,
          //     color: isNotificationEnabled ? ManagerColors.yellowColor : Colors.grey,
          //   ),
          //   onPressed: onToggleNotification,
          // ),
          SizedBox(width: ManagerWidth.w10),
        ],
      ),
    );
  }
}
