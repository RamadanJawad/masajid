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
import 'package:masajid/features/azkar/controller/azkar_controller.dart';

class BodyAzkar extends StatelessWidget {
  const BodyAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: ManagerHeight.h30),
      decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
      child: Column(
        children: [
          WidgetStack(
            name: ManagerStrings.azkar,
          ),
          GetBuilder<AzkarController>(
              init: AzkarController(),
              builder: (controller) {
                if (controller.isLoading) {
                  if (controller.azkar!.isNotEmpty) {
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
                              Text(
                                  controller.isClick
                                      ? controller.azkar![0]!.title!.ar!
                                      : controller.azkar![0]!.title!.en!,
                                  textAlign: TextAlign.center,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s22,
                                      color: ManagerColors.textColor)),
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.onChange();
                                },
                                child: Container(
                                  width: ManagerWidth.w70,
                                  height: ManagerHeight.h32,
                                  decoration: BoxDecoration(
                                      color: ManagerColors.colorTwoGradient,
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r50)),
                                  child: Align(
                                    alignment: controller.isClick
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: ManagerWidth.w6),
                                      width: ManagerWidth.w30,
                                      height: ManagerHeight.h26,
                                      decoration: BoxDecoration(
                                        color: ManagerColors.white,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r50),
                                      ),
                                      child: Text(
                                        controller.isClick ? "ar" : "en",
                                        style: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s14,
                                            color: ManagerColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ManagerHeight.h10,
                              ),
                              Text(
                                  controller.isClick
                                      ? controller.azkar![0]!.text!.ar!
                                      : controller.azkar![0]!.text!.en!,
                                  style: getRegularTextStyle(
                                      fontSize: ManagerFontSize.s18,
                                      color: ManagerColors.textColor)),
                            ],
                          ),
                        ),
                      ),
                    );
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
