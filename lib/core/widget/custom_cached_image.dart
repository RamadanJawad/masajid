import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:masajid/core/resources/manager_sizes.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key,required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(
          ManagerRadius.r14),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(
            child:
            CircularProgressIndicator()),
        errorWidget:
            (context, url, error) =>
        const Icon(
            Icons.broken_image,
            size: 50,
            color: Colors.grey),
      ),
    );
  }
}
