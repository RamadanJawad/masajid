import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/contactUs/controller/contactUs_controller.dart';
import 'package:masajid/features/contactUs/view/widget/custom_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactUsController>(
        init: ContactUsController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: ManagerHeight.h400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r20)),
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(35.78056000,
                        -78.63890000), // Center the map over London
                    initialZoom: 9.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                      userAgentPackageName:
                          'com.example.masajid', // Add your app identifier
                      // And many more recommended properties!
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point:const LatLng(35.78056000, -78.63890000),
                          width: ManagerWidth.w240,
                          height: ManagerHeight.h120,
                          child: Column(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: ManagerColors.colorTwoGradient,
                                size: ManagerIconSize.s40,
                              ),
                              Container(
                                width: ManagerWidth.w240,
                                height: ManagerHeight.h70,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                    color: ManagerColors.white,
                                    borderRadius: BorderRadius.circular(
                                        ManagerRadius.r4)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: ManagerWidth.w14,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r6),
                                      child: Image.asset(
                                        ManagerAssets.masjid,
                                        width: ManagerWidth.w50,
                                        height: ManagerHeight.h50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w10,
                                    ),
                                    Text(
                                      "20 Cooper Square, New\nYork, NY 10003, USA",
                                      style: getMediumTextStyle(
                                          fontSize: ManagerFontSize.s12,
                                          color: ManagerColors.black),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                child: SizedBox(
                  height: ManagerHeight.h180,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.contactUs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              if (index != 2) {
                                controller.openLink(
                                    controller.contactUs[index]['url']);
                              }
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  controller.contactUs[index]['icon'],
                                  width: ManagerWidth.w24,
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                Text(
                                  controller.contactUs[index]['url'],
                                  style: getRegularTextStyle(
                                      decoration: index == 0
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                      fontSize: ManagerFontSize.s16,
                                      color: index == 0
                                          ? ManagerColors.colorTwoGradient
                                          : ManagerColors.textColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Text(
                "You can also find and follow us on Social media",
                textAlign: TextAlign.center,
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.textColor),
              ),
              SizedBox(
                height: ManagerHeight.h10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          title: controller.socialMedia[0]['title'],
                          iconPath: controller.socialMedia[0]['icon'],
                          onPressed: () {
                            controller
                                .openLink(controller.socialMedia[0]['url']);
                          },
                        ),
                        CustomButton(
                          title: controller.socialMedia[1]['title'],
                          iconPath: controller.socialMedia[1]['icon'],
                          onPressed: () {
                            controller
                                .openLink(controller.socialMedia[1]['url']);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          title: controller.socialMedia[2]['title'],
                          iconPath: controller.socialMedia[2]['icon'],
                          onPressed: () {
                            controller
                                .openLink(controller.socialMedia[2]['url']);
                          },
                        ),
                        CustomButton(
                          title: controller.socialMedia[3]['title'],
                          iconPath: controller.socialMedia[3]['icon'],
                          onPressed: () {
                            controller
                                .openLink(controller.socialMedia[3]['url']);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h10,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
