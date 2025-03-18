import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/widget/custom_cached_image.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/gallery/controller/gallery_controller.dart';

class BodyGallery extends StatelessWidget {
  const BodyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:
        const BoxDecoration(color: ManagerColors.colorTwoGradient),
        child: Column(
          children: [
            const WidgetStack(name: "Photo ${ManagerStrings.gallery}"),
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
                child: GetBuilder<GalleryController>(
                    init: GalleryController(),
                    builder: (controller) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: ManagerHeight.h30,
                            ),
                            controller.isLoading
                                ? Expanded(
                                child: GridView.builder(
                                    itemCount: controller.gallery!.length,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                    itemBuilder: (_, index) {
                                      return CustomCachedImage(
                                          imageUrl: controller
                                              .gallery![index]!
                                              .originalUrl!);
                                    }))
                                : const CircularProgressIndicator()
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
