import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/manager_styles.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Text(
            ManagerStrings.prayingTimes,
            style: getBoldTextStyle(
                fontSize: ManagerFontSize.s20,
                color: ManagerColors.black),
          ),
          SizedBox(
            height: ManagerHeight.h50,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              height:  ManagerHeight.h50,
              color: Colors.grey[300],
            ),
          ),
           SizedBox(height: ManagerHeight.h10),
          ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h4),
                  height: ManagerHeight.h50,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
