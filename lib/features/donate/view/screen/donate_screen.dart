// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:masajid/features/donate/view/widget/body_donate.dart';

class DonateScreen extends StatelessWidget {
  final bool status;
  const DonateScreen({
    Key? key,
    this.status = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: BodyDonate(
          status: status,
        ),
      ),
    );
  }
}
