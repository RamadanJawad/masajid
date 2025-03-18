import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/qibla/controller/qibla_controller.dart';
class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;
  final QiblaController controller;

  const LocationErrorWidget({Key? key, this.error, this.callback, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          ManagerAssets.mosq,
          width: double.infinity,
          height: ManagerHeight.h160,
        ),
        SizedBox(
          height: ManagerHeight.h30,
        ),
        Text(error!,
            textAlign: TextAlign.center,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.black)),
        SizedBox(
          height: ManagerHeight.h30,
        ),
        SizedBox(
          width: ManagerWidth.w205,
          height: ManagerHeight.h48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: ManagerColors.colorOneGradient),
            onPressed: () {
              if (callback != null) callback!();
            },
            child: Text(
              "Try again",
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
