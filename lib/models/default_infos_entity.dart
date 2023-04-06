import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/default_infos_entity.g.dart';

@JsonSerializable()
class DefaultInfosEntity {

	late DefaultInfosHeader header;
	late DefaultInfosResponse response;
  
  DefaultInfosEntity();

  factory DefaultInfosEntity.fromJson(Map<String, dynamic> json) => $DefaultInfosEntityFromJson(json);

  Map<String, dynamic> toJson() => $DefaultInfosEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DefaultInfosHeader {

	late int status;
	late String message;
  
  DefaultInfosHeader();

  factory DefaultInfosHeader.fromJson(Map<String, dynamic> json) => $DefaultInfosHeaderFromJson(json);

  Map<String, dynamic> toJson() => $DefaultInfosHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DefaultInfosResponse {

	late String cgu;
	late int version;
	late String telephone;
	@JSONField(name: "version_android")
	late int versionAndroid;
	late bool blocked;
	late List<DefaultInfosResponseStations> stations;
	late List<String> carburants;
	late List<String> services;
	late List<DefaultInfosResponseMarquevehicules> marquevehicules;
  
  DefaultInfosResponse();

  factory DefaultInfosResponse.fromJson(Map<String, dynamic> json) => $DefaultInfosResponseFromJson(json);

  Map<String, dynamic> toJson() => $DefaultInfosResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DefaultInfosResponseStations {

	late String id;
	late String nom;
	late String longitude;
	late String latitude;
	late String adresse;
	late String lavage;
	late String restaurant;
	late String cafe;
	late String shop;
	late String vidange;
	late String entretien;
	late String ville;
	late String tpe;
	late String card;
	late String prixGasoil;
	late String prixSSP;
	late String tel;
	late String melange;
	late String elephant;
	@JSONField(name: "date_prix")
	late String datePrix;
	@JSONField(name: "VERSION")
	late String vERSION;
  
  DefaultInfosResponseStations();

  factory DefaultInfosResponseStations.fromJson(Map<String, dynamic> json) => $DefaultInfosResponseStationsFromJson(json);

  Map<String, dynamic> toJson() => $DefaultInfosResponseStationsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DefaultInfosResponseMarquevehicules {

	late String nom;
	late List<String> marque;
  
  DefaultInfosResponseMarquevehicules();

  factory DefaultInfosResponseMarquevehicules.fromJson(Map<String, dynamic> json) => $DefaultInfosResponseMarquevehiculesFromJson(json);

  Map<String, dynamic> toJson() => $DefaultInfosResponseMarquevehiculesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}