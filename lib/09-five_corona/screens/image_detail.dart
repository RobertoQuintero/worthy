import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worthy/09-five_corona/providers/form_register_provider.dart';
import 'package:worthy/09-five_corona/widgets/app_button.dart';

class ImageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)?.settings.arguments as File;
    final formRegisterProvider = Provider.of<FormRegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Image')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: image.path,
              child: Image.file(
                image,
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            AppButton(
                child: Text('Eliminar'),
                onPressed: () {
                  print(image.path);
                  formRegisterProvider.removeImage(image.path);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
