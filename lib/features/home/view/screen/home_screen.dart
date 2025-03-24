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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(color: ManagerColors.colorTwoGradient),
          child: Column(
            children: [
              const CustomStack(),
              Expanded(
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                  child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (controller) => controller.isLoading
                          ? const ShimmerWidget()
                          : Column(
                              children: [
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                Text(
                                  ManagerStrings.prayingTimes,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s20,
                                      color: ManagerColors.black),
                                ),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                SunriseWidget(
                                  sunrise: DateFormat.jm()
                                      .format(controller.prayerTimes!.sunrise),
                                ),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r10),
                                      border: Border.all(
                                        color:
                                            ManagerColors.grey.withOpacity(0.3),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Salah     ",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorOneGradient),
                                              ),
                                              Text(
                                                "Begins",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorOneGradient),
                                              ),
                                              Text(
                                                "Iqamah",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorOneGradient),
                                              ),
                                              Text(
                                                "alert",
                                                style: getBoldTextStyle(
                                                    fontSize:
                                                        ManagerFontSize.s16,
                                                    color: ManagerColors
                                                        .colorOneGradient),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: ManagerHeight.h6,
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .prayTimeData.length,
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
                                                          .currentPray ==
                                                      controller.prayTimeData[
                                                          index]['name'],
                                                  isNotificationEnabled: controller
                                                          .selectedNotificationPrayer ==
                                                      controller.prayTimeData[
                                                          index]['name'],
                                                  onToggleNotification: () =>
                                                      controller.toggleNotification(
                                                          controller
                                                                  .prayTimeData[
                                                              index]['name']),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ManagerHeight.h6,
                                ),
                                FridayWidget(
                                    fridayPrayersTime: controller
                                        .prayTimeData[1]['salahBegin']),
                              ],
                            )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
