import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ManagerRadius.r50),
            topRight: Radius.circular(ManagerRadius.r50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_data.png",
              width: ManagerWidth.w100,
              height: ManagerHeight.h100,
            ),
            Text(
              "No data coming from the API !",
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s20,
                  color: ManagerColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}
