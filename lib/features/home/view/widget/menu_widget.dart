import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/home/controller/home_controller.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ManagerColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r20)),
      child: GetBuilder<HomeController>(
        builder: (controller) =>controller.isLoading? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: ManagerColors.colorOneGradient,
                    size: ManagerIconSize.s30,
                  )),
              Center(
                child: Image.asset(
                  ManagerAssets.logo2,
                  width: ManagerWidth.w100,
                ),
              ),
              SizedBox(height: ManagerHeight.h10),
              GetBuilder<HomeController>(
                builder: (controller) {
                  // **Filter the available features**
                  final availableFeatures = controller.features!
                      .where((feature) => feature!.pivot!.isAvailable == 1)
                      .toList();

                  return SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: availableFeatures.length,
                      shrinkWrap: true, // Allows the GridView to take only needed height
                      physics:
                      const NeverScrollableScrollPhysics(), // Disables scrolling inside the dialog
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(availableFeatures[index]!.name!);
                              },
                              child: CircleAvatar(
                                backgroundColor: ManagerColors.iconColor,
                                radius: ManagerRadius.r30,
                                child: SvgPicture.network(
                                  availableFeatures[index]!.icon!.originalUrl!,
                                  width: ManagerWidth.w30,
                                ),
                              ),
                            ),
                            Text(
                              availableFeatures[index]!.name!,
                              style: getBoldTextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: ManagerFontSize.s15,
                                color: ManagerColors.textColor,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ):const Center(
        child: CircularProgressIndicator(
          color: ManagerColors.colorOneGradient,
        ))

      ),
    );
  }
}
