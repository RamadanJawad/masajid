import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, required this.iconPath, this.onPressed});

  final String title;
  final String iconPath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ManagerWidth.w160,
      height: ManagerHeight.h44,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: ManagerColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                side: BorderSide(color: Colors.grey.withOpacity(0.3)))),
        onPressed: onPressed,
        label: Text(
          title,
          style: getBoldTextStyle(
              fontSize: ManagerFontSize.s18, color: ManagerColors.textColor),
        ),
        icon: SvgPicture.asset(iconPath),
      ),
    );
  }
}
