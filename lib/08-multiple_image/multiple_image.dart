import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImage extends StatefulWidget {
  @override
  _MultipleImageState createState() => _MultipleImageState();
}

class _MultipleImageState extends State<MultipleImage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile?> images = [];

  setImages(String source) async {
    final XFile? image = await _picker.pickImage(
      source: source == 'gallery' ? ImageSource.gallery : ImageSource.camera,
      maxWidth: 300,
    );
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  setImages: setImages,
                  icon: Icons.photo_library,
                  source: 'gallery'),
              CustomButton(
                  setImages: setImages, icon: Icons.camera, source: 'camera'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            padding: EdgeInsets.all(5),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              var image = File(images[index]!.path);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Image.file(
                  image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.setImages,
      required this.icon,
      required this.source})
      : super(key: key);
  final Function setImages;
  final IconData icon;
  final String source;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(50, 50), shape: CircleBorder()),
        onPressed: () => setImages(source),
        child: Icon(
          icon,
          size: 25,
        ));
  }
}
