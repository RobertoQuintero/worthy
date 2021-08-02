import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormRegisterProvider extends ChangeNotifier {
  List<XFile?> images = [];
  bool _checked = false;

  bool get checked => this._checked;
  set checked(bool value) {
    this._checked = value;
    notifyListeners();
  }

  String _description = '';
  String get description => this._description;
  set description(String value) {
    this._description = value;
    notifyListeners();
  }

  removeImage(String path) {
    final filteredImages =
        images.where((element) => element!.path != path).toList();

    this.images = filteredImages;
    notifyListeners();
  }

  reset() {
    images = [];
    checked = false;
    description = '';
    notifyListeners();
  }
}
