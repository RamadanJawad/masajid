import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/widget_stack.dart';

class SingleAnnouncementsScreen extends StatelessWidget {
  final CacheItem? cacheItem;
  const SingleAnnouncementsScreen({super.key, this.cacheItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: ManagerHeight.h30),
        decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
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
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ManagerHeight.h30,
                      ),
                      Text(
                        cacheItem!.title!,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s20,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        height: ManagerHeight.h10,
                      ),
                      Container(
                        width: double.infinity,
                        height: ManagerHeight.h160,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          image: DecorationImage(
                            image: NetworkImage(cacheItem!.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment:
                            Alignment.topLeft, // <-- control child placement
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w10,
                            vertical: ManagerHeight.h16,
                          ),
                          padding: const EdgeInsets.all(5), // optional padding
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r8),
                          ),
                          child: Text(
                            DateFormat('MMM d, yyyy')
                                .format(DateTime.parse(cacheItem!.dateTime!)),
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s12,
                                color: ManagerColors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h20,
                      ),
                      Text(
                        cacheItem!.details!,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
