import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/home/controller/home_controller.dart';
import 'package:masajid/features/home/view/widget/costom_stack.dart';
import 'package:masajid/features/home/view/widget/custom_praytime.dart';
import 'package:masajid/features/home/view/widget/friday_widget.dart';
import 'package:masajid/features/home/view/widget/shimmer_widget.dart';
import 'package:masajid/features/home/view/widget/sunrise_widget.dart';
import 'package:shimmer/shimmer.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
                const BoxDecoration(color: ManagerColors.colorTwoGradient),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomStack(
                    currentPrayName: controller.currentPrayName ?? "",
                    currentPrayTime: controller.currentPrayTime ?? "",
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ManagerRadius.r50),
                          topRight: Radius.circular(ManagerRadius.r50),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                        child: controller.isLoading
                            ? const ShimmerWidget()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: ManagerHeight.h30),
                                  Text(
                                    ManagerStrings.prayingTimes,
                                    style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s20,
                                      color: ManagerColors.black,
                                    ),
                                  ),
                                  SizedBox(height: ManagerHeight.h16),
                                  SunriseWidget(
                                    sunrise: DateFormat.jm().format(
                                        controller.prayerTimes!.sunrise),
                                  ),
                                  SizedBox(height: ManagerHeight.h10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r10),
                                      border: Border.all(
                                        color: ManagerColors.borderColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ManagerWidth.w16,
                                        vertical: ManagerHeight.h20,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                " Salah       ",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorTwoGradient),
                                              ),
                                              Text(
                                                "Begins",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorTwoGradient),
                                              ),
                                              Text(
                                                "Iqamah   ",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorTwoGradient),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: ManagerHeight.h14,
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(0),
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                controller.prayTimeData.length,
                                            itemBuilder: (context, index) {
                                              return CustomPrayTime(
                                                salahName: controller
                                                        .prayTimeData[index]
                                                    ['name'],
                                                salahBegin: controller
                                                        .prayTimeData[index]
                                                    ['salahBegin'],
                                                salahIqaamah: controller
                                                        .prayTimeData[index]
                                                    ['salahIqaamah'],
                                                isCurrent: controller
                                                        .currentPrayName ==
                                                    controller
                                                            .prayTimeData[index]
                                                        ['name'],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: ManagerHeight.h20),
                                  controller.isLoading ||
                                          controller.jomaTime == null
                                      ? Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: ManagerHeight.h4),
                                            height: ManagerHeight.h50,
                                            width: double.infinity,
                                            color: Colors.grey[300],
                                          ),
                                        )
                                      : FridayWidget(
                                          fridayPrayersTime:
                                              controller.formatJomaTime(
                                                  controller.jomaTime!),
                                        ),
                                  SizedBox(height: ManagerHeight.h20),
                                ],
                              ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
