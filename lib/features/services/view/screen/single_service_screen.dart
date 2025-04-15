import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/services/model/services.dart';

class SingleServiceScreen extends StatelessWidget {
  final Services itemsServices;
  const SingleServiceScreen({super.key, required this.itemsServices});

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
                  name: ManagerStrings.services,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ManagerRadius.r50),
                      topRight: Radius.circular(ManagerRadius.r50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: ManagerHeight.h20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                itemsServices.icon!.originalUrl!,
                                width: ManagerWidth.w32,
                                height: ManagerHeight.h32,
                              ),
                              SizedBox(
                                width: ManagerWidth.w10,
                              ),
                              Text(itemsServices.title!,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s24,
                                      color: ManagerColors.black)),
                            ],
                          ),
                          SizedBox(
                            height: ManagerHeight.h10,
                          ),
                          Image.network(
                            itemsServices.image!.originalUrl!,
                            width: ManagerWidth.w300,
                            height: ManagerHeight.h200,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          Text(itemsServices.description!,
                              style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.black)),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                        ],
                      ),
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
