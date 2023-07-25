import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/carte_response_entity.g.dart';

@JsonSerializable()
class CarteResponseEntity {

	@JSONField(name: "PAN")
	late String pAN;
	@JSONField(name: "NOM")
	late String nOM;
	@JSONField(name: "VHS")
	late String vHS;
  bool cheked =false ;
  
  CarteResponseEntity();

  factory CarteResponseEntity.fromJson(Map<String, dynamic> json) => $CarteResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarteResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}