// To parse this JSON data, do
//
//     final auditModel = auditModelFromMap(jsonString);

import 'dart:convert';

class AuditModel {
  AuditModel({
    required this.auditId,
    required this.area,
    required this.allOk,
    required this.successRegisters,
    required this.date,
  });

  String auditId;
  String area;
  bool allOk;
  int successRegisters;
  DateTime date;

  factory AuditModel.fromJson(String str) =>
      AuditModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuditModel.fromMap(Map<String, dynamic> json) => AuditModel(
        auditId: json["audit_id"],
        area: json["area"],
        allOk: json["all_ok"],
        successRegisters: json["success_registers"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "audit_id": auditId,
        "area": area,
        "all_ok": allOk,
        "success_registers": successRegisters,
        "date": date.toIso8601String(),
      };
}
