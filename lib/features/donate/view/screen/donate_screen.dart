import 'package:flutter/material.dart';
import 'package:masajid/features/donate/view/widget/body_donate.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyDonate(),
    );
  }
}
