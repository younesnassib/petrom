import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/alerte_response_entity.g.dart';

@JsonSerializable()
class AlerteResponseEntity {

	late double id;
	@JSONField(name: "user_id")
	late double userId;
	@JSONField(name: "nom_alert")
	late String nomAlert;
	late String matricule;
	@JSONField(name: "date_declenche")
	late String dateDeclenche;
	@JSONField(name: "distance_declenche")
	late double distanceDeclenche;
	@JSONField(name: "frequence_date")
	late String frequenceDate;
	@JSONField(name: "frequence_distance")
	late double frequenceDistance;
	late String description;
	@JSONField(name: "type_frequence_temps")
	late double typeFrequenceTemps;
	late String type;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
  
  AlerteResponseEntity();

  factory AlerteResponseEntity.fromJson(Map<String, dynamic> json) => $AlerteResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AlerteResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}