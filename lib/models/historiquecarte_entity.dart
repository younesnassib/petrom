import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/historiquecarte_entity.g.dart';

@JsonSerializable()
class HistoriquecarteEntity {

	late HistoriquecarteHeader header;
	late List<HistoriquecarteResponse> response;
  
  HistoriquecarteEntity();

  factory HistoriquecarteEntity.fromJson(Map<String, dynamic> json) => $HistoriquecarteEntityFromJson(json);

  Map<String, dynamic> toJson() => $HistoriquecarteEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoriquecarteHeader {

	late int status;
	late String message;
	late String messageAr;
  
  HistoriquecarteHeader();

  factory HistoriquecarteHeader.fromJson(Map<String, dynamic> json) => $HistoriquecarteHeaderFromJson(json);

  Map<String, dynamic> toJson() => $HistoriquecarteHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HistoriquecarteResponse {

	@JSONField(name: "C")
	late String c;
	@JSONField(name: "P")
	late String p;
	@JSONField(name: "Q")
	late double q;
	@JSONField(name: "M")
	late double m;
	late int id;
  
  HistoriquecarteResponse();

  factory HistoriquecarteResponse.fromJson(Map<String, dynamic> json) => $HistoriquecarteResponseFromJson(json);

  Map<String, dynamic> toJson() => $HistoriquecarteResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}