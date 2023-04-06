import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/car_add_entity.g.dart';

@JsonSerializable()
class CarAddEntity {

	late CarAddHeader header;
	dynamic response;
  
  CarAddEntity();

  factory CarAddEntity.fromJson(Map<String, dynamic> json) => $CarAddEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarAddEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CarAddHeader {

	late int status;
	late String message;
	late String messageAr;
  
  CarAddHeader();

  factory CarAddHeader.fromJson(Map<String, dynamic> json) => $CarAddHeaderFromJson(json);

  Map<String, dynamic> toJson() => $CarAddHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}