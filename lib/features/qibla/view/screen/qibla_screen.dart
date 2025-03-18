import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/qibla/controller/qibla_controller.dart';
import 'package:masajid/features/qibla/view/widget/qibla_compos.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(QiblaController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
          const BoxDecoration(color: ManagerColors.colorTwoGradient),
          child: Column(
            children: [
              const WidgetStack(
                name: ManagerStrings.qibla,
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
                      padding:  EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: FlutterQiblah.androidDeviceSensorSupport(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: ManagerWidth.w2,
                                  ),
                                );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error.toString()}'),
                                );
                              }
                              if (snapshot.hasData) {
                                return const QiblaCompass();
                              } else {
                                return const Text('Error');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
