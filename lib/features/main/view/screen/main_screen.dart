import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/features/main/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<MainController>(
            init: MainController(),
            builder: (controller) {
              return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).padding.bottom),
                  height: ManagerHeight.h60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.changeIndex(index);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom: index == controller.currentIndex ? 0 : 10,
                              right: ManagerWidth.w24,
                              left: ManagerWidth.w24,
                            ),
                            width: ManagerWidth.w40,
                            height: index == controller.currentIndex
                                ? ManagerHeight.h6
                                : 0,
                            decoration: BoxDecoration(
                              color: ManagerColors.colorTwoGradient,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(ManagerRadius.r10),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            controller.listOfIcons[index],
                            color: index == controller.currentIndex
                                ? ManagerColors.colorTwoGradient
                                : Colors.black38,
                          ),
                          SizedBox(height: ManagerHeight.h10),
                        ],
                      ),
                    ),
                  ),
                ),
                body: controller.screen[controller.currentIndex],
              );
            }));
  }
}
