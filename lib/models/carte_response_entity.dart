import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/carte_response_entity.g.dart';

@JsonSerializable()
class CarteResponseEntity {

	@JSONField(name: "PAN")
	late String pAN;
	@JSONField(name: "NOM")
	late String nOM;
	late String nomsurlacarte;
	late String plafondJ;
	late String plafondH;
	late String plafondM;
	late String plafondHL;
	late String plafondJL;
	late String plafondML;
	@JSONField(name: "Listevehicules")
	late String listevehicules;
	late String typecarte;
	late String listeproduit;
	@JSONField(name: "Idclient")
	late String idclient;
	@JSONField(name: "Restrictiongeo")
	late String restrictiongeo;
	@JSONField(name: "VHS")
	late String vHS;
  
  CarteResponseEntity();

  factory CarteResponseEntity.fromJson(Map<String, dynamic> json) => $CarteResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarteResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}