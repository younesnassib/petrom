import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/alerte_response_entity.dart';

AlerteResponseEntity $AlerteResponseEntityFromJson(Map<String, dynamic> json) {
	final AlerteResponseEntity alerteResponseEntity = AlerteResponseEntity();
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		alerteResponseEntity.id = id;
	}
	final double? userId = jsonConvert.convert<double>(json['user_id']);
	if (userId != null) {
		alerteResponseEntity.userId = userId;
	}
	final String? nomAlert = jsonConvert.convert<String>(json['nom_alert']);
	if (nomAlert != null) {
		alerteResponseEntity.nomAlert = nomAlert;
	}
	final String? matricule = jsonConvert.convert<String>(json['matricule']);
	if (matricule != null) {
		alerteResponseEntity.matricule = matricule;
	}
	final String? dateDeclenche = jsonConvert.convert<String>(json['date_declenche']);
	if (dateDeclenche != null) {
		alerteResponseEntity.dateDeclenche = dateDeclenche;
	}
	final double? distanceDeclenche = jsonConvert.convert<double>(json['distance_declenche']);
	if (distanceDeclenche != null) {
		alerteResponseEntity.distanceDeclenche = distanceDeclenche;
	}
	final String? frequenceDate = jsonConvert.convert<String>(json['frequence_date']);
	if (frequenceDate != null) {
		alerteResponseEntity.frequenceDate = frequenceDate;
	}
	final double? frequenceDistance = jsonConvert.convert<double>(json['frequence_distance']);
	if (frequenceDistance != null) {
		alerteResponseEntity.frequenceDistance = frequenceDistance;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		alerteResponseEntity.description = description;
	}
	final double? typeFrequenceTemps = jsonConvert.convert<double>(json['type_frequence_temps']);
	if (typeFrequenceTemps != null) {
		alerteResponseEntity.typeFrequenceTemps = typeFrequenceTemps;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		alerteResponseEntity.type = type;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		alerteResponseEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		alerteResponseEntity.updatedAt = updatedAt;
	}
	return alerteResponseEntity;
}

Map<String, dynamic> $AlerteResponseEntityToJson(AlerteResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['user_id'] = entity.userId;
	data['nom_alert'] = entity.nomAlert;
	data['matricule'] = entity.matricule;
	data['date_declenche'] = entity.dateDeclenche;
	data['distance_declenche'] = entity.distanceDeclenche;
	data['frequence_date'] = entity.frequenceDate;
	data['frequence_distance'] = entity.frequenceDistance;
	data['description'] = entity.description;
	data['type_frequence_temps'] = entity.typeFrequenceTemps;
	data['type'] = entity.type;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}