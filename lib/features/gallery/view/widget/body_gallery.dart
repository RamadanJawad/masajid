import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/widget/circular_progress_widget.dart';
import 'package:masajid/core/widget/custom_cached_image.dart';
import 'package:masajid/core/widget/empty_data_widget.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/gallery/controller/gallery_controller.dart';
import 'package:masajid/features/gallery/view/screen/image_screen.dart';

class BodyGallery extends StatelessWidget {
  const BodyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
        child: Column(
          children: [
            WidgetStack(name: "Photo ${ManagerStrings.gallery}"),
            GetBuilder<GalleryController>(
                init: GalleryController(),
                builder: (controller) {
                  if (controller.isLoading) {
                    if (controller.gallery!.isNotEmpty) {
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
                                Expanded(
                                    child: GridView.builder(
                                        itemCount: controller.gallery!.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5,
                                                mainAxisSpacing: 5),
                                        itemBuilder: (_, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(() => FullScreenImageView(
                                                    imageUrl: controller
                                                        .gallery![index]!
                                                        .originalUrl!,
                                                  ));
                                            },
                                            child: CustomCachedImage(
                                                imageUrl: controller
                                                    .gallery![index]!
                                                    .originalUrl!),
                                          );
                                        }))
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
      ),
    );
  }
}
