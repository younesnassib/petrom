import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/deletealerte_entity.g.dart';

@JsonSerializable()
class DeletealerteEntity {

	late DeletealerteHeader header;
	late List<dynamic> response;
  
  DeletealerteEntity();

  factory DeletealerteEntity.fromJson(Map<String, dynamic> json) => $DeletealerteEntityFromJson(json);

  Map<String, dynamic> toJson() => $DeletealerteEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DeletealerteHeader {

	late int status;
	late String message;
	late String messageAr;
  
  DeletealerteHeader();

  factory DeletealerteHeader.fromJson(Map<String, dynamic> json) => $DeletealerteHeaderFromJson(json);

  Map<String, dynamic> toJson() => $DeletealerteHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}