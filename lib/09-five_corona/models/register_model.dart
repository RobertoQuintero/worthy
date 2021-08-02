// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);

import 'dart:convert';

class RegisterModel {
  RegisterModel(
      {required this.idTask,
      required this.area,
      required this.sector,
      required this.images,
      required this.imagesSolved,
      required this.registerDescription,
      required this.registerDescriptionSolved,
      required this.isOk,
      required this.auditId,
      this.id,
      required this.date});

  String idTask;
  String area;
  String sector;
  List<String> images;
  List<String> imagesSolved;
  String registerDescription;
  String registerDescriptionSolved;
  bool isOk;
  String? id;
  String auditId;
  DateTime date;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
      idTask: json["id_task"],
      area: json["area"],
      sector: json["sector"],
      images: List<String>.from(json["images"].map((x) => x)),
      imagesSolved: List<String>.from(json["images_solved"].map((x) => x)),
      registerDescription: json["register_description"],
      registerDescriptionSolved: json["register_description_solved"],
      isOk: json["is_ok"],
      auditId: json["audit_id"],
      date: DateTime.parse(json["date"]));

  Map<String, dynamic> toMap() => {
        "id_task": idTask,
        "area": area,
        "sector": sector,
        "images": List<String>.from(images.map((x) => x)),
        "images_solved": List<String>.from(imagesSolved.map((x) => x)),
        "register_description": registerDescription,
        "register_description_solved": registerDescriptionSolved,
        "is_ok": isOk,
        "audit_id": auditId,
        "date": date.toIso8601String()
      };
}
