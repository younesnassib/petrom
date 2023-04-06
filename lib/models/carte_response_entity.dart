import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/carte_response_entity.g.dart';

@JsonSerializable()
class CarteResponseEntity {
  late CarteResponseHeader header;
  late List<CarteResponseResponse> response;

  CarteResponseEntity();

  factory CarteResponseEntity.fromJson(Map<String, dynamic> json) =>
      $CarteResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarteResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CarteResponseHeader {
  late int status;
  late String message;
  late String messageAr;

  CarteResponseHeader();

  factory CarteResponseHeader.fromJson(Map<String, dynamic> json) =>
      $CarteResponseHeaderFromJson(json);

  Map<String, dynamic> toJson() => $CarteResponseHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CarteResponseResponse {
  @JSONField(name: "PAN")
  late String pAN;
  @JSONField(name: "NOM")
  late String nOM;
  @JSONField(name: "VHS")
  late String vHS;

  bool cheked =false ;

  CarteResponseResponse();

  factory CarteResponseResponse.fromJson(Map<String, dynamic> json) =>
      $CarteResponseResponseFromJson(json);

  Map<String, dynamic> toJson() => $CarteResponseResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
