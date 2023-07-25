import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/car_response_entity.dart';

CarResponseEntity $CarResponseEntityFromJson(Map<String, dynamic> json) {
	final CarResponseEntity carResponseEntity = CarResponseEntity();
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		carResponseEntity.id = id;
	}
	final double? userId = jsonConvert.convert<double>(json['user_id']);
	if (userId != null) {
		carResponseEntity.userId = userId;
	}
	final String? matricule = jsonConvert.convert<String>(json['matricule']);
	if (matricule != null) {
		carResponseEntity.matricule = matricule;
	}
	final String? libelle = jsonConvert.convert<String>(json['libelle']);
	if (libelle != null) {
		carResponseEntity.libelle = libelle;
	}
	final String? marque = jsonConvert.convert<String>(json['marque']);
	if (marque != null) {
		carResponseEntity.marque = marque;
	}
	final String? modele = jsonConvert.convert<String>(json['modele']);
	if (modele != null) {
		carResponseEntity.modele = modele;
	}
	final String? motorisation = jsonConvert.convert<String>(json['motorisation']);
	if (motorisation != null) {
		carResponseEntity.motorisation = motorisation;
	}
	final String? carburant = jsonConvert.convert<String>(json['carburant']);
	if (carburant != null) {
		carResponseEntity.carburant = carburant;
	}
	final String? panCarte = jsonConvert.convert<String>(json['pan_carte']);
	if (panCarte != null) {
		carResponseEntity.panCarte = panCarte;
	}
	final String? reservoir = jsonConvert.convert<String>(json['reservoir']);
	if (reservoir != null) {
		carResponseEntity.reservoir = reservoir;
	}
	final dynamic? consMin = jsonConvert.convert<dynamic>(json['cons_min']);
	if (consMin != null) {
		carResponseEntity.consMin = consMin;
	}
	final dynamic? consMax = jsonConvert.convert<dynamic>(json['cons_max']);
	if (consMax != null) {
		carResponseEntity.consMax = consMax;
	}
	final dynamic? kmInit = jsonConvert.convert<dynamic>(json['km_init']);
	if (kmInit != null) {
		carResponseEntity.kmInit = kmInit;
	}
	final double? kmCourant = jsonConvert.convert<double>(json['km_courant']);
	if (kmCourant != null) {
		carResponseEntity.kmCourant = kmCourant;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		carResponseEntity.status = status;
	}
	final dynamic? nfc = jsonConvert.convert<dynamic>(json['nfc']);
	if (nfc != null) {
		carResponseEntity.nfc = nfc;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		carResponseEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		carResponseEntity.updatedAt = updatedAt;
	}
	return carResponseEntity;
}

Map<String, dynamic> $CarResponseEntityToJson(CarResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['user_id'] = entity.userId;
	data['matricule'] = entity.matricule;
	data['libelle'] = entity.libelle;
	data['marque'] = entity.marque;
	data['modele'] = entity.modele;
	data['motorisation'] = entity.motorisation;
	data['carburant'] = entity.carburant;
	data['pan_carte'] = entity.panCarte;
	data['reservoir'] = entity.reservoir;
	data['cons_min'] = entity.consMin;
	data['cons_max'] = entity.consMax;
	data['km_init'] = entity.kmInit;
	data['km_courant'] = entity.kmCourant;
	data['status'] = entity.status;
	data['nfc'] = entity.nfc;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}