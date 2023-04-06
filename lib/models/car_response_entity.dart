import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/car_response_entity.g.dart';

@JsonSerializable()
class CarResponseEntity {

	late CarResponseHeader header;
	late List<CarResponseResponse> response;
  
  CarResponseEntity();

  factory CarResponseEntity.fromJson(Map<String, dynamic> json) => $CarResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CarResponseHeader {

	late int status;
	late String message;
	late String messageAr;
  
  CarResponseHeader();

  factory CarResponseHeader.fromJson(Map<String, dynamic> json) => $CarResponseHeaderFromJson(json);

  Map<String, dynamic> toJson() => $CarResponseHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CarResponseResponse {

	late String matricule;
	late String libelle;
	late String marque;
	late String modele;
	late String motorisation;
	late String carburant;
	late String reservoir;
	@JSONField(name: "km_courrant")
	late String kmCourrant;
	@JSONField(name: "user_insert")
	late String userInsert;
	@JSONField(name: "pan_carte")
	late String panCarte;
	@JSONField(name: "date_insert")
	late String dateInsert;
	late String tag;
  
  CarResponseResponse();

  factory CarResponseResponse.fromJson(Map<String, dynamic> json) => $CarResponseResponseFromJson(json);

  Map<String, dynamic> toJson() => $CarResponseResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}