import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/circular_progress_widget.dart';
import 'package:masajid/core/widget/empty_data_widget.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/announcements/controller/announcements_controller.dart';
import 'package:masajid/features/announcements/view/widget/carousel_slider_widget.dart';
import 'package:masajid/features/announcements/view/widget/events_widget.dart';

class BodyAnnouncements extends StatelessWidget {
  const BodyAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(color: ManagerColors.colorTwoGradient),
          child: CacheData().getStatusAnnouncement() ?? true
              ? Column(
                  children: [
                    WidgetStack(
                      name: ManagerStrings.announcements,
                      visible: false,
                    ),
                    GetBuilder<AnnouncementsController>(
                        init: AnnouncementsController(),
                        builder: (controller) {
                          if (controller.isLoading) {
                            if (controller.announcements!.isNotEmpty) {
                              return Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              ManagerRadius.r50),
                                          topRight: Radius.circular(
                                              ManagerRadius.r50),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: ManagerHeight.h20,
                                          ),
                                          CarouselSliderWidget(
                                              controller: controller),
                                          SizedBox(
                                            height: ManagerHeight.h10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                                controller
                                                    .announcements!.length,
                                                (index) => AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      height: 8,
                                                      width: controller
                                                                  .currentIndex ==
                                                              index
                                                          ? 16
                                                          : 8, // Active dot is wider
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                    .currentIndex ==
                                                                index
                                                            ? ManagerColors
                                                                .colorOneGradient
                                                            : Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    )),
                                          ),
                                          SizedBox(
                                            height: ManagerHeight.h10,
                                          ),
                                          Text(
                                            ManagerStrings.events,
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s22,
                                                color: ManagerColors.textColor),
                                          ),
                                          SizedBox(
                                            height: ManagerHeight.h10,
                                          ),
                                          EventsWidget(controller: controller),
                                        ],
                                      )));
                            } else {
                              return const EmptyDataWidget();
                            }
                          }
                          return const CircularProgressWidget();
                        }),
                  ],
                )
              : Center(
                  child: Text(
                    "This Feature is not avalible!",
                    style: getBoldTextStyle(
                        fontSize: ManagerFontSize.s24,
                        color: ManagerColors.black),
                  ),
                )),
    );
  }
}
