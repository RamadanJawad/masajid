import 'package:flutter/material.dart';
import 'package:masajid/features/services/view/widget/body_services.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyServices(),
    );
  }
}
