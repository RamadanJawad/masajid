import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/features/splash/controller/splash_controller.dart';
import 'package:masajid/features/splash/view/widget/body_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: BodySplash(),
      ),
    );
  }
}
