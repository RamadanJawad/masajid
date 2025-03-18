import 'package:flutter/material.dart';
import 'package:masajid/features/announcements/view/widget/body_announcements.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyAnnouncements(),
    );
  }
}
