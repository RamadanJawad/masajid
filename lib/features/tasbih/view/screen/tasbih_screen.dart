import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/tasbih/controller/tasbih_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../model/tasbih.dart';

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
                              GetBuilder<TasbihController>(
                                  init: TasbihController(),
                                  builder: (controller) {
                                    return SizedBox(
                                      child: CustomDropdown(
                                        fillColor: Colors.white,
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade100),
                                        hintText: "choose tasbih",
                                        listItemStyle: getRegularTextStyle(
                                            fontSize: ManagerFontSize.s16,
                                            color: Colors.black),
                                        selectedStyle: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s18,
                                            color: ManagerColors.textColor),
                                        items: controller.isLoading
                                            ? []
                                            : controller.item,
                                        hintStyle: getRegularTextStyle(
                                            fontSize: ManagerFontSize.s16,
                                            color: Colors.grey),
                                        controller:
                                            controller.dorpDownController,
                                        borderRadius: BorderRadius.circular(
                                            ManagerRadius.r10),
                                        onChanged: (val) {
                                          var selectedTasbihData =
                                              controller.tasbih?.firstWhere(
                                                  (element) =>
                                                      element!.text!.ar == val,
                                                  orElse: () => Tasbih(
                                                      id: 0,
                                                      text: TextLang(
                                                          en: "", ar: ""),
                                                      pronunciation: "",
                                                      reference: ""));
                                          controller.onUpdateData(
                                              selectedTasbihData!.text!.en,
                                              selectedTasbihData);
                                        },
                                      ),
                                    );
                                  }),
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
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SfRadialGauge(axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: controller.maximum,
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: const AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color.fromARGB(30, 0, 169, 181),
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: controller.value,
                                          color: ManagerColors.colorTwoGradient,
                                          cornerStyle: CornerStyle.bothCurve,
                                          width: 0.2,
                                          sizeUnit: GaugeSizeUnit.factor,
                                        )
                                      ],
                                    )
                                  ]),
                                  InkWell(
                                    onTap: () {
                                      controller.addValue();
                                    },
                                    child: Container(
                                      width: ManagerWidth.w100,
                                      height: ManagerHeight.h100,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              ManagerColors.colorOneGradient),
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "Tap\n${controller.value.toInt()}",
                                          style: getBoldTextStyle(
                                              fontSize: ManagerFontSize.s20,
                                              color: ManagerColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  width: ManagerWidth.w180,
                                  height: ManagerHeight.h60,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF3F8FB),
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
                                        radius: 30,
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
                                      "Reset",
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
