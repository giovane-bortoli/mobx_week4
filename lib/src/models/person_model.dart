import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PersonModel {
  final String name;
  final String birthdate;
  final String cpf;
  final String phone;
  final String email;
  final String gender;
  final String male;
  final String female;
  final String other;
  final String notSay;

  PersonModel({
    required this.name,
    required this.birthdate,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.gender,
    required this.male,
    required this.female,
    required this.other,
    required this.notSay,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      birthdate: json['birthdate'],
      cpf: json['cpf'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      male: json['male'],
      female: json['female'],
      other: json['other'],
      notSay: json['notSay'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'birthdate': birthdate,
        'cpf': cpf,
        'phone': phone,
        'email': email,
        'gender': gender,
        'male': male,
        'female': female,
        'other': other,
        'notSay': notSay
      };
}
