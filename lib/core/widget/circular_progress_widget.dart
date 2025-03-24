import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_sizes.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        child:const Center(
          child: CircularProgressIndicator(
            color: ManagerColors.colorOneGradient,
          ),
        ),
      ),
    );
  }
}
