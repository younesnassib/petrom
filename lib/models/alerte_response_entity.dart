import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/alerte_response_entity.g.dart';

@JsonSerializable()
class AlerteResponseEntity {
  late AlerteResponseHeader header;
  late List<AlerteResponseResponse> response;

  AlerteResponseEntity();

  factory AlerteResponseEntity.fromJson(Map<String, dynamic> json) =>
      $AlerteResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AlerteResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AlerteResponseHeader {
  late int status;
  late String message;
  late String messageAr;

  AlerteResponseHeader();

  factory AlerteResponseHeader.fromJson(Map<String, dynamic> json) =>
      $AlerteResponseHeaderFromJson(json);

  Map<String, dynamic> toJson() => $AlerteResponseHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AlerteResponseResponse {
  late String id;
  late String matricule;
  @JSONField(name: "nom_alert")
  late String nomAlert;
  @JSONField(name: "date_declenche")
  late String dateDeclenche;
  @JSONField(name: "distance_declenche")
  late String distanceDeclenche;
  @JSONField(name: "frequence_date")
  late String frequenceDate;
  @JSONField(name: "frequence_distance")
  late String frequenceDistance;
  late String description;
  @JSONField(name: "type_frequence_temps")
  late String typeFrequenceTemps;
  late String type;

  AlerteResponseResponse();

  factory AlerteResponseResponse.fromJson(Map<String, dynamic> json) =>
      $AlerteResponseResponseFromJson(json);

  Map<String, dynamic> toJson() => $AlerteResponseResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
