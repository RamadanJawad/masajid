import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/announcements/controller/announcements_controller.dart';
import 'package:masajid/features/announcements/view/screen/single_announcement.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnnouncementsController>(builder: (controller) {
      return SizedBox(
        height: ManagerHeight.h180,
        child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.announcements!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: ManagerWidth.w16,
                      top: ManagerHeight.h20,
                    ),
                    width: ManagerWidth.w280,
                    height: ManagerHeight.h140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(controller
                                .announcements![index]!.image!.originalUrl!),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ManagerAssets.details),
                                Text(
                                  DateFormat('MMM d, yyyy').format(
                                      DateTime.parse(controller
                                          .announcements![index]!.startDate!)),
                                  style: getRegularTextStyle(
                                      fontSize: ManagerFontSize.s10,
                                      color: ManagerColors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ManagerHeight.h10,
                            ),
                            Text(
                              controller.announcements![index]!.details!,
                              style: getBoldTextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: ManagerFontSize.s14,
                                  color: ManagerColors.white),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                if (controller.announcements!.isNotEmpty) {
                                  var cacheItem = CacheItem.announcements(
                                      imagePath: controller
                                          .announcements![index]!
                                          .image!
                                          .originalUrl!,
                                      details: controller
                                          .announcements![index]!.details,
                                      title: controller
                                          .announcements![index]!.title,
                                      dateTime: controller
                                          .announcements![index]!.startDate);
                                  Get.to(() => SingleAnnouncementsScreen(
                                        cacheItem: cacheItem,
                                      ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r10)),
                                  backgroundColor: ManagerColors.white),
                              child: Text(
                                "Details",
                                style: getBoldTextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    color: ManagerColors.textColor),
                              ),
                            ),
                            SizedBox(
                              height: ManagerHeight.h8,
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }),
      );
    });
  }
}
