// To parse this JSON data, do
//
//     final taskModel = taskModelFromMap(jsonString);

import 'dart:convert';

class TaskModel {
  TaskModel({
    required this.area,
    required this.description,
    required this.id,
    required this.sector,
    required this.verificationItem,
    this.saved = false,
  });

  String area;
  String description;
  String id;
  String sector;
  String verificationItem;
  String? docId;
  bool saved;

  factory TaskModel.fromJson(String str) => TaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        area: json["area"],
        description: json["description"],
        id: json["id"],
        sector: json["sector"],
        verificationItem: json["verification_item"],
      );

  Map<String, dynamic> toMap() => {
        "area": area,
        "description": description,
        "id": id,
        "sector": sector,
        "verification_item": verificationItem,
      };
}
