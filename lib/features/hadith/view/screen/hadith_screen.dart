import 'package:flutter/material.dart';
import 'package:masajid/features/hadith/view/widget/body_hadith.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyHadith(),
    );
  }
}
