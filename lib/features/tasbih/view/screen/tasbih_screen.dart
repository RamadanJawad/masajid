import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/tasbih/controller/tasbih_controller.dart';
import 'package:masajid/features/tasbih/view/widget/dropdown_widget.dart';
import 'package:masajid/features/tasbih/view/widget/radial_gauge_widget.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TasbihController>(
          init: TasbihController(),
          builder: (controller) {
            return SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    const BoxDecoration(color: ManagerColors.colorTwoGradient),
                child: Column(
                  children: [
                    const WidgetStack(
                      name: ManagerStrings.tasbih,
                    ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: ManagerHeight.h30,
                              ),
                              DropdownWidget(controller: controller),
                              SizedBox(
                                height: ManagerHeight.h6,
                              ),
                              Text(
                                controller.selectedEnTasbih,
                                style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color:
                                        ManagerColors.black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: ManagerHeight.h6,
                              ),
                              Text(
                                controller.selectedPronunciation,
                                style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: ManagerColors.colorTwoGradient),
                              ),
                              RadialGaugeWidget(controller: controller),
                              Center(
                                child: Container(
                                  width: ManagerWidth.w180,
                                  height: ManagerHeight.h60,
                                  decoration: BoxDecoration(
                                      color:const Color(0xffF3F8FB),
                                      borderRadius: BorderRadius.circular(
                                          ManagerRadius.r30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor:
                                            ManagerColors.colorTwoGradient,
                                        child: IconButton(
                                          onPressed: () {
                                            controller.sub();
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: ManagerColors.white,
                                            size: ManagerIconSize.s30,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.maximum.toInt().toString(),
                                        style: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s20,
                                            color: ManagerColors.black),
                                      ),
                                      CircleAvatar(
                                        radius: ManagerRadius.r30,
                                        backgroundColor:
                                            ManagerColors.colorTwoGradient,
                                        child: IconButton(
                                          onPressed: () {
                                            controller.add();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: ManagerColors.white,
                                            size: ManagerIconSize.s30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      controller.reset();
                                    },
                                    child: Text(
                                      ManagerStrings.reset,
                                      style: getRegularTextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: ManagerFontSize.s18,
                                          color:
                                              ManagerColors.colorTwoGradient),
                                    )),
                              )
                            ]),
                      ),
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
