import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/contactUs/controller/contactUs_controller.dart';
import 'package:masajid/features/contactUs/view/widget/custom_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme:const IconThemeData(color: ManagerColors.white),
        backgroundColor: ManagerColors.colorOneGradient,
        title: Text(
          ManagerStrings.contactUs,
          style: getBoldTextStyle(
              fontSize: ManagerFontSize.s20, color: ManagerColors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(color: ManagerColors.colorTwoGradient),
          child: Column(
            children: [
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
                child: GetBuilder<ContactUsController>(
                    init: ContactUsController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: ManagerHeight.h400,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(ManagerRadius.r20)),
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
                                      'com.example.app', // Add your app identifier
                                  // And many more recommended properties!
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10),
                            child: SizedBox(
                              height: ManagerHeight.h120,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.contactUs.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: InkWell(
                                        onTap: () {
                                          controller.openLink(controller
                                              .contactUs[index]['url']);
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              controller.contactUs[index]
                                                  ['icon'],
                                              width: ManagerWidth.w24,
                                            ),
                                            SizedBox(
                                              width: ManagerWidth.w6,
                                            ),
                                            Text(
                                              controller.contactUs[index]
                                                  ['url'],
                                              style: getRegularTextStyle(
                                                  decoration: index == 0
                                                      ? TextDecoration.underline
                                                      : TextDecoration.none,
                                                  fontSize: ManagerFontSize.s16,
                                                  color: index == 0
                                                      ? ManagerColors
                                                          .colorTwoGradient
                                                      : ManagerColors
                                                          .textColor),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomButton(
                                      title: controller.socialMedia[0]['title'],
                                      iconPath: controller.socialMedia[0]
                                          ['icon'],
                                      onPressed: () {
                                        controller.openLink(
                                            controller.socialMedia[0]['url']);
                                      },
                                    ),
                                    CustomButton(
                                      title: controller.socialMedia[1]['title'],
                                      iconPath: controller.socialMedia[1]
                                          ['icon'],
                                      onPressed: () {
                                        controller.openLink(
                                            controller.socialMedia[1]['url']);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomButton(
                                      title: controller.socialMedia[2]['title'],
                                      iconPath: controller.socialMedia[2]
                                          ['icon'],
                                      onPressed: () {
                                        controller.openLink(
                                            controller.socialMedia[2]['url']);
                                      },
                                    ),
                                    CustomButton(
                                      title: controller.socialMedia[3]['title'],
                                      iconPath: controller.socialMedia[3]
                                          ['icon'],
                                      onPressed: () {
                                        controller.openLink(
                                            controller.socialMedia[3]['url']);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
