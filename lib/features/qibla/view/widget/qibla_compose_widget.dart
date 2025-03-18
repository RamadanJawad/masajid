import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/qibla/controller/qibla_controller.dart';

class QiblahCompassWidget extends StatelessWidget {
  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblaController>(builder: (controller) {
      return StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          }
          final qiblahDirection = snapshot.data!;
          controller.animation = Tween(
              begin: controller.begin,
              end: (qiblahDirection.qiblah * (pi / 180) * -1))
              .animate(controller.animationController!);
          controller.begin = (qiblahDirection.qiblah * (pi / 180) * -1);
          controller.animationController!.forward(from: 0);
          return Column(
            children: [
              SizedBox(
                height: ManagerHeight.h30,
              ),
              Text(
                "Qibla angle:${snapshot.data!.qiblah.toStringAsFixed(2)}",
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s14,
                    color: ManagerColors.textColor),
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              AnimatedBuilder(
                animation: controller.animation!,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        ManagerAssets.compose,
                        fit: BoxFit.fill,
                        height: ManagerHeight.h375,
                      ),
                      Transform.rotate(
                        angle: controller.animation!.value,
                        child: Center(
                          child: Image.asset(
                            ManagerAssets.qibla2,
                            width: ManagerWidth.w170,
                            fit: BoxFit.cover, //needle
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: ManagerHeight.h30,
              ),
              SvgPicture.asset(
                ManagerAssets.location,
                width: ManagerWidth.w30,
              ),
              SizedBox(
                height: ManagerHeight.h10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "${controller.placemarks![0].locality!} ,",
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.textColor)),
                  TextSpan(
                      text: controller.placemarks![0].country!,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.textColor))
                ]),
              )
            ],
          );
        },
      );
    });
  }
}