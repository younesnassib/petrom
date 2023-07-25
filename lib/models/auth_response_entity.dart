import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/auth_response_entity.g.dart';

@JsonSerializable()
class AuthResponseEntity {

	late String status;
	dynamic message;
	late AuthResponseData data;
  
  AuthResponseEntity();

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) => $AuthResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseData {

	late AuthResponseDataUser user;
	late String token;
  
  AuthResponseData();

  factory AuthResponseData.fromJson(Map<String, dynamic> json) => $AuthResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseDataUser {

	late int id;
	late String email;
	late String phone;
	@JSONField(name: "code_sap")
	late String codeSap="";
	@JSONField(name: "device_id")
	late String deviceId;
	@JSONField(name: "device_id_second")
	dynamic deviceIdSecond;
	@JSONField(name: "date_birth")
	late String dateBirth;
	late String gender;
	late String city;
	late String adresse;
	late String profession;
	@JSONField(name: "compte_id")
	late String compteId;
	@JSONField(name: "email_verified_at")
	dynamic emailVerifiedAt;
	@JSONField(name: "activated_at")
	late String activatedAt;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
  
  AuthResponseDataUser();

  factory AuthResponseDataUser.fromJson(Map<String, dynamic> json) => $AuthResponseDataUserFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseDataUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}