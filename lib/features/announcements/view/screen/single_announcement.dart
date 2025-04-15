import 'package:flutter/material.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/widget_stack.dart';

class SingleAnnouncementsScreen extends StatelessWidget {
  final CacheItem? cacheItem;
  const SingleAnnouncementsScreen({super.key,  this.cacheItem});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
                const BoxDecoration(color: ManagerColors.colorTwoGradient),
            child: Column(
              children: [
                 WidgetStack(
                  name: ManagerStrings.announcements,
                  visible: true,
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
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ManagerHeight.h20,
                        ),
                        Text(
                          cacheItem!.title!,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s20,
                              color: ManagerColors.black),
                        ),
                        SizedBox(
                          height: ManagerHeight.h10,
                        ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 5),
                      child: Image.network(
                        cacheItem!.imagePath!,
                        width: ManagerWidth.w280,
                        fit: BoxFit.fill,
                      ),
                    ),
                        SizedBox(
                          height: ManagerHeight.h20,
                        ),
                        Text(
                          cacheItem!.details!,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s20,
                              color: ManagerColors.black),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
