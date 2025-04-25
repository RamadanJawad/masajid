import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:masajid/features/services/controller/services_controller.dart';
import 'package:masajid/features/services/view/screen/single_service_screen.dart';

class BodyServices extends StatelessWidget {
  const BodyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: ManagerHeight.h30),
      decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
      child: Column(
        children: [
          WidgetStack(
            name: ManagerStrings.services,
          ),
          GetBuilder<ServicesController>(
              init: ServicesController(),
              builder: (controller) {
                if (controller.isLoading) {
                  if (controller.services!.isNotEmpty) {
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: ManagerHeight.h30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(ManagerStrings.burlington,
                                    style: getBoldTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color:
                                            ManagerColors.colorOneGradient)),
                                SvgPicture.asset(ManagerAssets.qoba),
                                Text(ManagerStrings.mosque,
                                    style: getBoldTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color: ManagerColors.black)),
                              ],
                            ),
                            SizedBox(
                              height: ManagerHeight.h16,
                            ),
                            Text(ManagerStrings.exploreServices,
                                style: getBoldTextStyle(
                                    fontSize: ManagerFontSize.s24,
                                    color: ManagerColors.black)),
                            SizedBox(
                              height: ManagerHeight.h10,
                            ),
                            Expanded(
                                child: SizedBox(
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(10),
                                        itemCount:
                                            controller.services!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                bottom: ManagerHeight.h10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ManagerRadius.r20),
                                                border: Border.all(
                                                    color: ManagerColors
                                                        .borderColor)),
                                            child: Column(
                                              children: [
                                                Image.network(controller
                                                    .services![index]!
                                                    .icon!
                                                    .originalUrl!),
                                                Text(
                                                  controller.services![index]!
                                                      .title!,
                                                  style: getRegularTextStyle(
                                                      fontSize:
                                                          ManagerFontSize.s18,
                                                      color: ManagerColors
                                                          .black),
                                                ),
                                                Text(
                                                  controller.services![index]!
                                                      .description!,
                                                  style: getRegularTextStyle(
                                                      fontSize:
                                                          ManagerFontSize.s16,
                                                      color:
                                                          ManagerColors.grey),
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Get.to(SingleServiceScreen(
                                                            itemsServices:
                                                                controller
                                                                        .services![
                                                                    index]!));
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ManagerColors
                                                                  .colorOneGradient,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      ManagerRadius
                                                                          .r10))),
                                                      child: Text(
                                                        ManagerStrings
                                                            .readMore,
                                                        style: getBoldTextStyle(
                                                            fontSize:
                                                                ManagerFontSize
                                                                    .s18,
                                                            color:
                                                                ManagerColors
                                                                    .white),
                                                      )),
                                                )
                                              ],
                                            ),
                                          );
                                        })))
                          ],
                        ),
                      ),
                    ));
                  } else {
                    return const EmptyDataWidget();
                  }
                }
                return const CircularProgressWidget();
              }),
        ],
      ),
    );
  }
}
