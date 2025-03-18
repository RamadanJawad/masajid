import 'package:flutter/material.dart';
import 'package:masajid/features/gallery/view/widget/body_gallery.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyGallery(),
    );
  }
}
