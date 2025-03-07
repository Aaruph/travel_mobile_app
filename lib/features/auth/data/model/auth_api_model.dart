import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String email;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.fname,
    required this.lname,
    required this.image,
    required this.phone,
    required this.email,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      fName: fname,
      lName: lname,
      image: image,
      phone: phone,
      email: email,
      password: password ?? '',
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      fname: entity.fName,
      lname: entity.lName,
      image: entity.image,
      phone: entity.phone,
      email: entity.email,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props =>
      [id, fname, lname, image, phone,email, password];
}