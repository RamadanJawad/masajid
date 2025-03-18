import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/features/qibla/controller/qibla_controller.dart';
import 'package:masajid/features/qibla/view/widget/location_error_widget.dart';
import 'package:masajid/features/qibla/view/widget/qibla_compose_widget.dart';

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblaController>(
      builder: (controller) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CupertinoActivityIndicator();
              }
              if (snapshot.data!.enabled == true) {
                switch (snapshot.data!.status) {
                  case LocationPermission.always:
                  case LocationPermission.whileInUse:
                    return QiblahCompassWidget();
                  case LocationPermission.denied:
                    return LocationErrorWidget(
                      error: "Location service permission denied",
                      callback: controller.checkLocationStatus,
                      controller: controller,
                    );
                  case LocationPermission.deniedForever:
                    return LocationErrorWidget(
                      error: "Location service Denied Forever !",
                      callback: controller.checkLocationStatus,
                      controller: controller,
                    );
                  default:
                    return Container();
                }
              } else {
                return LocationErrorWidget(
                  error:
                      "To know the direction of the Qiblah, please activate the location feature on your phone.",
                  callback: controller.checkLocationStatus,
                  controller: controller,
                );
              }
            },
          ),
        );
      },
    );
  }
}
