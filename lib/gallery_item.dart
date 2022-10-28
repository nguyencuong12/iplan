import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryItem {
  GalleryItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryItem galleryItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryItem.id,
          child: Image.asset(galleryItem.resource, height: 40.0),
        ),
      ),
    );
  }
}
