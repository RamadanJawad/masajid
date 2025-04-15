import 'package:flutter/material.dart';
import 'package:masajid/features/azkar/view/widget/body_azkar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: BodyAzkar(),
      ),
    );
  }
}
