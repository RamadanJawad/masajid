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
import 'package:masajid/core/widget/custom_cached_image.dart';
import 'package:masajid/core/widget/empty_data_widget.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/donate/controller/donate_controller.dart';

class BodyDonate extends StatelessWidget {
  const BodyDonate({super.key});

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
            name: ManagerStrings.donate,
            visible: true,
          ),
          GetBuilder<DonateController>(
              init: DonateController(),
              builder: (controller) {
                if (controller.isLoading) {
                  if (controller.donate != null) {
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: ManagerHeight.h20,
                                  width: double.infinity,
                                ),
                                Text("Donate to Burlington Mosque",
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color: ManagerColors.black)),
                                SizedBox(
                                  height: ManagerHeight.h20,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    CustomCachedImage(
                                        imageUrl: controller
                                            .donate!.image!.originalUrl!),
                                    Positioned(
                                      left: -30, // Adjust positioning
                                      bottom: -30,
                                      child: SvgPicture.asset(
                                        ManagerAssets
                                            .border, // Replace with your local green frame asset
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h30,
                                ),
                                Text(controller.donate!.message!,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: ManagerColors.black)),
                                SizedBox(
                                  height: ManagerHeight.h20,
                                ),
                                SizedBox(
                                  height: ManagerHeight.h50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  ManagerRadius.r10)),
                                          backgroundColor:
                                              ManagerColors.colorTwoGradient),
                                      onPressed: () {
                                        controller
                                            .openLink(controller.donate!.link!);
                                      },
                                      child: Text(
                                        "Donate",
                                        style: getRegularTextStyle(
                                            fontSize: ManagerFontSize.s18,
                                            color: ManagerColors.white),
                                      )),
                                )
                              ],
                            ),
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
