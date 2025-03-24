import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/circular_progress_widget.dart';
import 'package:masajid/core/widget/empty_data_widget.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/aboutUs/controller/abouttUs_controller.dart';

class BodyAbout extends StatelessWidget {
  const BodyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
        child: Column(
          children: [
            const WidgetStack(
              name: ManagerStrings.aboutUs,
            ),
            GetBuilder<AboutUsController>(
                init: AboutUsController(),
                builder: (controller) {
              if (controller.isLoading) {
                if (controller.about != null) {
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Burlington",
                                      style: getBoldTextStyle(
                                          fontSize: ManagerFontSize.s20,
                                          color:
                                              ManagerColors.colorOneGradient)),
                                  SvgPicture.asset(ManagerAssets.qoba),
                                  Text("Mosque",
                                      style: getBoldTextStyle(
                                          fontSize: ManagerFontSize.s20,
                                          color: ManagerColors.black)),
                                ],
                              ),
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Image.network(
                                    controller.about!.aboutImage!.originalUrl!,
                                    width: ManagerWidth.w325,
                                    height: ManagerHeight.h200,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    left: -30, // Adjust positioning
                                    bottom: -30,
                                    child: SvgPicture.asset(
                                      ManagerAssets
                                          .border, // Replace with your local green frame asset
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ManagerHeight.h30,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ManagerWidth.w20,
                                    vertical: ManagerHeight.h10),
                                child: Text(controller.about!.about!,
                                    textAlign: TextAlign.justify,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: ManagerColors.black)),
                              ),
                              Image.network(
                                controller.about!.missionIcon!.originalUrl!,
                                width: ManagerWidth.w60,
                              ),
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              Text("Our Mission",
                                  textAlign: TextAlign.justify,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s18,
                                      color: ManagerColors.textColor)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ManagerWidth.w20,
                                    vertical: ManagerHeight.h10),
                                child: Text(controller.about!.mission!,
                                    textAlign: TextAlign.justify,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: ManagerColors.black)),
                              ),
                              Image.network(
                                  controller.about!.visionIcon!.originalUrl!),
                              Text("Our Vision",
                                  textAlign: TextAlign.justify,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s18,
                                      color: ManagerColors.textColor)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ManagerWidth.w20,
                                    vertical: ManagerHeight.h10),
                                child: Text(controller.about!.vision!,
                                    textAlign: TextAlign.justify,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s18,
                                        color: ManagerColors.black)),
                              ),
                            ],
                          )));
                } else {
                  return const EmptyDataWidget();
                }
              }
              return const CircularProgressWidget();
            }),
          ],
        ),
      ),
    );
  }
}
