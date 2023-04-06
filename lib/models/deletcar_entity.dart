import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/deletcar_entity.g.dart';

@JsonSerializable()
class DeletcarEntity {

	late DeletcarHeader header;
	dynamic response;
  
  DeletcarEntity();

  factory DeletcarEntity.fromJson(Map<String, dynamic> json) => $DeletcarEntityFromJson(json);

  Map<String, dynamic> toJson() => $DeletcarEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DeletcarHeader {

	late int status;
	late String message;
	late String messageAr;
  
  DeletcarHeader();

  factory DeletcarHeader.fromJson(Map<String, dynamic> json) => $DeletcarHeaderFromJson(json);

  Map<String, dynamic> toJson() => $DeletcarHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}