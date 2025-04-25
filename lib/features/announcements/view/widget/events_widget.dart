import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/announcements/controller/announcements_controller.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key, required this.controller});
  final AnnouncementsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: controller.events!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                controller.events![index]!.title!,
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColors.black),
              ),
              subtitle: Text(
                controller.events![index]!.place!,
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.grey),
              ),
              leading: CircleAvatar(
                radius: ManagerRadius.r30,
                backgroundColor: ManagerColors.colorOneGradient,
                child: Text(
                  "${DateFormat('d').format(DateTime.parse(controller.events![index]!.start!))}\n${DateFormat('MMM').format(DateTime.parse(controller.events![index]!.start!))}",
                  textAlign: TextAlign.center,
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.white),
                ),
              ),
            );
          }),
    );
  }
}
