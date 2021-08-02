import 'package:flutter/material.dart';
import 'package:worthy/09-five_corona/models/register_model.dart';

class AuditProvider extends ChangeNotifier {
  List<RegisterModel> registers = [];
  String area = '';
  String auditId = '';

  int get successRegisters =>
      registers.where((element) => element.isOk == true).toList().length;

  bool get allOk => successRegisters == registers.length;

  void reset() {
    registers = [];
    area = '';
    auditId = '';
    notifyListeners();
  }
}
