import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:worthy/09-five_corona/functions/images_handler.dart';
import 'package:worthy/09-five_corona/models/audit_model.dart';
import 'package:worthy/09-five_corona/models/register_model.dart';
import 'package:worthy/09-five_corona/models/task_model.dart';
import 'package:http/http.dart' as http;

class RequestServices extends ChangeNotifier {
  final List<TaskModel> tasks = [];
  final String _baseUrl =
      'https://flutter-varios-b3dfc-default-rtdb.firebaseio.com';
  bool isLoading = true;

  RequestServices() {
    this.getTasks();
  }

  bool get totalSaved =>
      tasks.where((element) => element.saved == true).length == tasks.length;

  void unSaved() {
    tasks.forEach((element) {
      element.saved = false;
    });
  }

  Future getTasks() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/catalogo/almacen.json');
    final resp = await http.get(url);
    final Map<String, dynamic> tasksMap = json.decode(resp.body);
    tasksMap.forEach((key, value) {
      final task = TaskModel.fromMap(value);
      task.docId = key;
      tasks.add(task);
    });
    tasks.sort((b, a) {
      final aItem = int.tryParse(a.id);
      final bItem = int.tryParse(b.id);
      return bItem!.compareTo(aItem!);
    });
    isLoading = false;
    notifyListeners();
  }

  Future<String> createRegister(
      TaskModel task, List<XFile?> images, RegisterModel register) async {
    isLoading = true;
    notifyListeners();
    final List<String> imagesList = [];
    for (var image in images) {
      await ImagesHandler.uploadImage(image).then((path) {
        if (path != null) {
          imagesList.add(path.toString());
        }
      });
    }

    register.images = imagesList;

    final url = Uri.parse('$_baseUrl/register.json');
    final resp = await http.post(url, body: register.toJson());
    final decodedData = json.decode(resp.body);

    register.id = decodedData['name'];

    isLoading = false;
    notifyListeners();
    // print(decodedData);
    return decodedData['name'];
  }

  Future<String> createAudit(AuditModel audit) async {
    String result = '';
    try {
      final url = Uri.parse('$_baseUrl/audit.json');
      final resp = await http.post(url, body: audit.toJson());
      final decodedData = json.decode(resp.body);
      result = decodedData['name'];
    } catch (e) {
      print(e.toString());
      result = 'Error en el servidor';
    }
    return result;
  }
}
