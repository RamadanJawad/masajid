import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../controller/tasbih_controller.dart';

class RadialGaugeWidget extends StatelessWidget {
  const RadialGaugeWidget({super.key, required this.controller});

  final TasbihController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
