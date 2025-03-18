import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/announcements/controller/announcements_controller.dart';
import 'package:masajid/features/announcements/view/screen/single_announcement.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.controller});
  final AnnouncementsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ManagerHeight.h200,
      padding: const EdgeInsets.all(10),
      child: CarouselSlider.builder(
          itemCount: controller
              .announcements!.length,
          itemBuilder: (BuildContext context,
              int itemIndex,
              int pageViewIndex) =>
              Container(
                  width: ManagerWidth.w300,
                  height: ManagerHeight.h140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              controller
                                  .announcements![
                              itemIndex]!
                                  .image!
                                  .originalUrl!),
                          fit: BoxFit.fill),
                      borderRadius:
                      BorderRadius.circular(
                          ManagerRadius.r10)),
                  child: Padding(
                    padding:
                    const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller
                              .announcements![
                          itemIndex]!
                              .startDate!,
                          style: getRegularTextStyle(
                              fontSize:
                              ManagerFontSize
                                  .s10,
                              color: ManagerColors
                                  .white),
                        ),
                        Text(
                          controller
                              .announcements![
                          itemIndex]!
                              .details!,
                          style: getBoldTextStyle(
                            overflow: TextOverflow.ellipsis,
                              fontSize:
                              ManagerFontSize
                                  .s14,
                              color: ManagerColors
                                  .white),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            var cacheItem = CacheItem.announcements(
                                imagePath: controller
                                    .announcements![
                                itemIndex]!
                                    .image!
                                    .originalUrl!,
                                details: controller
                                    .announcements![
                                itemIndex]!
                                    .details,
                                title: controller
                                    .announcements![
                                itemIndex]!
                                    .title,
                                dateTime: controller
                                    .announcements![
                                itemIndex]!
                                    .createdAt);
                            Get.to(() =>
                                SingleAnnouncementsScreen(
                                  cacheItem:
                                  cacheItem,
                                ));
                          },
                          style: ElevatedButton
                              .styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                              backgroundColor:
                              ManagerColors
                                  .white),
                          child: Text(
                            "Details",
                            style: getBoldTextStyle(
                                fontSize:
                                ManagerFontSize
                                    .s14,
                                color: ManagerColors
                                    .textColor),
                          ),
                        )
                      ],
                    ),
                  )),
          options: CarouselOptions(
            aspectRatio: 16 / 8,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval:
            const Duration(seconds: 3),
            autoPlayAnimationDuration:
            const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              controller.onChange(index);
            },
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
