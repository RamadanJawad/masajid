import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_sizes.dart';

class BodySplash extends StatelessWidget {
  const BodySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: ManagerColors.colorOneGradient),
      child: Column(
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: ManagerWidth.w160,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w30),
            child: Image.asset(
              ManagerAssets.mosq,
              width: ManagerWidth.w300,
            ),
          ),
        ],
      ),
    );
  }
}
