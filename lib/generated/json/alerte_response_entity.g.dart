import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/alerte_response_entity.dart';

AlerteResponseEntity $AlerteResponseEntityFromJson(Map<String, dynamic> json) {
	final AlerteResponseEntity alerteResponseEntity = AlerteResponseEntity();
	final AlerteResponseHeader? header = jsonConvert.convert<AlerteResponseHeader>(json['header']);
	if (header != null) {
		alerteResponseEntity.header = header;
	}
	final List<AlerteResponseResponse>? response = jsonConvert.convertListNotNull<AlerteResponseResponse>(json['response']);
	if (response != null) {
		alerteResponseEntity.response = response;
	}
	return alerteResponseEntity;
}

Map<String, dynamic> $AlerteResponseEntityToJson(AlerteResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response.map((v) => v.toJson()).toList();
	return data;
}

AlerteResponseHeader $AlerteResponseHeaderFromJson(Map<String, dynamic> json) {
	final AlerteResponseHeader alerteResponseHeader = AlerteResponseHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		alerteResponseHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		alerteResponseHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		alerteResponseHeader.messageAr = messageAr;
	}
	return alerteResponseHeader;
}

Map<String, dynamic> $AlerteResponseHeaderToJson(AlerteResponseHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

AlerteResponseResponse $AlerteResponseResponseFromJson(Map<String, dynamic> json) {
	final AlerteResponseResponse alerteResponseResponse = AlerteResponseResponse();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		alerteResponseResponse.id = id;
	}
	final String? matricule = jsonConvert.convert<String>(json['matricule']);
	if (matricule != null) {
		alerteResponseResponse.matricule = matricule;
	}
	final String? nomAlert = jsonConvert.convert<String>(json['nom_alert']);
	if (nomAlert != null) {
		alerteResponseResponse.nomAlert = nomAlert;
	}
	final String? dateDeclenche = jsonConvert.convert<String>(json['date_declenche']);
	if (dateDeclenche != null) {
		alerteResponseResponse.dateDeclenche = dateDeclenche;
	}
	final String? distanceDeclenche = jsonConvert.convert<String>(json['distance_declenche']);
	if (distanceDeclenche != null) {
		alerteResponseResponse.distanceDeclenche = distanceDeclenche;
	}
	final String? frequenceDate = jsonConvert.convert<String>(json['frequence_date']);
	if (frequenceDate != null) {
		alerteResponseResponse.frequenceDate = frequenceDate;
	}
	final String? frequenceDistance = jsonConvert.convert<String>(json['frequence_distance']);
	if (frequenceDistance != null) {
		alerteResponseResponse.frequenceDistance = frequenceDistance;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		alerteResponseResponse.description = description;
	}
	final String? typeFrequenceTemps = jsonConvert.convert<String>(json['type_frequence_temps']);
	if (typeFrequenceTemps != null) {
		alerteResponseResponse.typeFrequenceTemps = typeFrequenceTemps;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		alerteResponseResponse.type = type;
	}
	return alerteResponseResponse;
}

Map<String, dynamic> $AlerteResponseResponseToJson(AlerteResponseResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['matricule'] = entity.matricule;
	data['nom_alert'] = entity.nomAlert;
	data['date_declenche'] = entity.dateDeclenche;
	data['distance_declenche'] = entity.distanceDeclenche;
	data['frequence_date'] = entity.frequenceDate;
	data['frequence_distance'] = entity.frequenceDistance;
	data['description'] = entity.description;
	data['type_frequence_temps'] = entity.typeFrequenceTemps;
	data['type'] = entity.type;
	return data;
}