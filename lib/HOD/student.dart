import 'dart:io';

class Student {
  int? id;
  String? name;
  String? email;
  String? registrationNumber;
  String? semester;
  String? section;
  File? image;

  Student({
    this.id,
    this.name,
    this.email,
    this.registrationNumber,
    this.semester,
    this.section,
    this.image,
  });
}
