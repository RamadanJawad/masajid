import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/features/home/view/widget/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ManagerColors.white,
        body: BodyHome(),
      ),
    );
  }
}
