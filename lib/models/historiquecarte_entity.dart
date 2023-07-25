import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/historiquecarte_entity.g.dart';

@JsonSerializable()
class HistoriquecarteEntity {

	@JSONField(name: "C")
	late String c;
	@JSONField(name: "P")
	late String p;
	@JSONField(name: "Q")
	late double q;
	@JSONField(name: "M")
	late double m;
	late double id;
  
  HistoriquecarteEntity();

  factory HistoriquecarteEntity.fromJson(Map<String, dynamic> json) => $HistoriquecarteEntityFromJson(json);

  Map<String, dynamic> toJson() => $HistoriquecarteEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}