import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/circular_progress_widget.dart';
import 'package:masajid/core/widget/empty_data_widget.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/hadith/controller/hadith_controller.dart';

class BodyHadith extends StatelessWidget {
  const BodyHadith({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
        child: Column(
          children: [
            WidgetStack(
              name: "Todays ${ManagerStrings.hadith}",
            ),
            GetBuilder<HadithController>(
              init: HadithController(),
              builder: (controller) {
                if (controller.isLoading) {
                  if (controller.hadith != null) {
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
                                horizontal: ManagerWidth.w14),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: ManagerHeight.h30,
                                  ),
                                  RichText(
                                      textDirection: TextDirection.rtl,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "${controller.hadith!.isnad!} ",
                                            style: TextStyle(
                                              fontFamily: "ElMessiri",
                                              fontSize: ManagerFontSize.s18,
                                              fontWeight: FontWeight.w500,
                                              color: ManagerColors.textColor
                                                  .withOpacity(0.6),
                                            )),
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: ManagerWidth.w4,
                                        )),
                                        TextSpan(
                                            text: controller.hadith!.matn!,
                                            style: TextStyle(
                                              fontFamily: "ElMessiri",
                                              fontSize: ManagerFontSize.s18,
                                              fontWeight: FontWeight.w500,
                                              color: ManagerColors.textColor,
                                            ))
                                      ])),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  Text(controller.hadith!.muhaddith!.en!,
                                      style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s16,
                                          color:
                                              ManagerColors.colorOneGradient)),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  Text(controller.hadith!.description!,
                                      style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s16,
                                          color:
                                              ManagerColors.colorOneGradient)),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: ManagerHeight.h100,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r10),
                                        color: const Color(0xffF3F8FB)),
                                    child: ListView.builder(
                                        itemCount: controller
                                            .hadith!.references!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${controller.hadith!.references![index].title!}: ",
                                                    style: getBoldTextStyle(
                                                        fontSize:
                                                            ManagerFontSize.s14,
                                                        color: ManagerColors
                                                            .textColor),
                                                  ),
                                                  Text(
                                                    controller
                                                        .hadith!
                                                        .references![index]
                                                        .reference!,
                                                    style: getRegularTextStyle(
                                                        fontSize:
                                                            ManagerFontSize.s14,
                                                        color: ManagerColors
                                                            .colorOneGradient),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: ManagerHeight.h10,
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  } else {
                    return const EmptyDataWidget();
                  }
                }
                return const CircularProgressWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
