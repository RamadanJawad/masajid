import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/menu/model/icon_model.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ManagerColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: ManagerColors.colorOneGradient,
                size: ManagerIconSize.s30,
              )),
          Center(
            child: Image.asset(
              ManagerAssets.logo2,
              width: ManagerWidth.w100,
            ),
          ),
          SizedBox(height: ManagerHeight.h10),
          SizedBox(
            width: double.infinity,
            child: GridView.builder(
              itemCount: IconModel.iconData.length,
              shrinkWrap:
                  true, // Allows the GridView to take only needed height
              physics:
                  const NeverScrollableScrollPhysics(), // Disables scrolling inside the dialog
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(IconModel.iconData[index].routeName);
                      },
                      child: CircleAvatar(
                        backgroundColor: ManagerColors.iconColor,
                        radius: ManagerRadius.r30,
                        child: SvgPicture.asset(
                          IconModel.iconData[index].imagePath,
                          width: ManagerWidth.w30,
                        ),
                      ),
                    ),
                    Text(
                      IconModel.iconData[index].name,
                      style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.textColor,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
