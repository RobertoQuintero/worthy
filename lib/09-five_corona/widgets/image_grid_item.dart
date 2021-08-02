import 'dart:io';

import 'package:flutter/material.dart';

class ImageGridItem extends StatelessWidget {
  const ImageGridItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'image_detail', arguments: image),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Hero(
          tag: image.path,
          child: Image.file(
            image,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
