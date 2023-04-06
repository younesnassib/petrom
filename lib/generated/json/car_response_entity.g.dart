import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';

CarResponseEntity $CarResponseEntityFromJson(Map<String, dynamic> json) {
	final CarResponseEntity carResponseEntity = CarResponseEntity();
	final CarResponseHeader? header = jsonConvert.convert<CarResponseHeader>(json['header']);
	if (header != null) {
		carResponseEntity.header = header;
	}
	final List<CarResponseResponse>? response = jsonConvert.convertListNotNull<CarResponseResponse>(json['response']);
	if (response != null) {
		carResponseEntity.response = response;
	}
	return carResponseEntity;
}

Map<String, dynamic> $CarResponseEntityToJson(CarResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response.map((v) => v.toJson()).toList();
	return data;
}

CarResponseHeader $CarResponseHeaderFromJson(Map<String, dynamic> json) {
	final CarResponseHeader carResponseHeader = CarResponseHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		carResponseHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		carResponseHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		carResponseHeader.messageAr = messageAr;
	}
	return carResponseHeader;
}

Map<String, dynamic> $CarResponseHeaderToJson(CarResponseHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

CarResponseResponse $CarResponseResponseFromJson(Map<String, dynamic> json) {
	final CarResponseResponse carResponseResponse = CarResponseResponse();
	final String? matricule = jsonConvert.convert<String>(json['matricule']);
	if (matricule != null) {
		carResponseResponse.matricule = matricule;
	}
	final String? libelle = jsonConvert.convert<String>(json['libelle']);
	if (libelle != null) {
		carResponseResponse.libelle = libelle;
	}
	final String? marque = jsonConvert.convert<String>(json['marque']);
	if (marque != null) {
		carResponseResponse.marque = marque;
	}
	final String? modele = jsonConvert.convert<String>(json['modele']);
	if (modele != null) {
		carResponseResponse.modele = modele;
	}
	final String? motorisation = jsonConvert.convert<String>(json['motorisation']);
	if (motorisation != null) {
		carResponseResponse.motorisation = motorisation;
	}
	final String? carburant = jsonConvert.convert<String>(json['carburant']);
	if (carburant != null) {
		carResponseResponse.carburant = carburant;
	}
	final String? reservoir = jsonConvert.convert<String>(json['reservoir']);
	if (reservoir != null) {
		carResponseResponse.reservoir = reservoir;
	}
	final String? kmCourrant = jsonConvert.convert<String>(json['km_courrant']);
	if (kmCourrant != null) {
		carResponseResponse.kmCourrant = kmCourrant;
	}
	final String? userInsert = jsonConvert.convert<String>(json['user_insert']);
	if (userInsert != null) {
		carResponseResponse.userInsert = userInsert;
	}
	final String? panCarte = jsonConvert.convert<String>(json['pan_carte']);
	if (panCarte != null) {
		carResponseResponse.panCarte = panCarte;
	}
	final String? dateInsert = jsonConvert.convert<String>(json['date_insert']);
	if (dateInsert != null) {
		carResponseResponse.dateInsert = dateInsert;
	}
	final String? tag = jsonConvert.convert<String>(json['tag']);
	if (tag != null) {
		carResponseResponse.tag = tag;
	}
	return carResponseResponse;
}

Map<String, dynamic> $CarResponseResponseToJson(CarResponseResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['matricule'] = entity.matricule;
	data['libelle'] = entity.libelle;
	data['marque'] = entity.marque;
	data['modele'] = entity.modele;
	data['motorisation'] = entity.motorisation;
	data['carburant'] = entity.carburant;
	data['reservoir'] = entity.reservoir;
	data['km_courrant'] = entity.kmCourrant;
	data['user_insert'] = entity.userInsert;
	data['pan_carte'] = entity.panCarte;
	data['date_insert'] = entity.dateInsert;
	data['tag'] = entity.tag;
	return data;
}