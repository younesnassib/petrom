import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/default_infos_entity.dart';
import 'dart:ffi';


DefaultInfosEntity $DefaultInfosEntityFromJson(Map<String, dynamic> json) {
	final DefaultInfosEntity defaultInfosEntity = DefaultInfosEntity();
	final DefaultInfosHeader? header = jsonConvert.convert<DefaultInfosHeader>(json['header']);
	if (header != null) {
		defaultInfosEntity.header = header;
	}
	final DefaultInfosResponse? response = jsonConvert.convert<DefaultInfosResponse>(json['response']);
	if (response != null) {
		defaultInfosEntity.response = response;
	}
	return defaultInfosEntity;
}

Map<String, dynamic> $DefaultInfosEntityToJson(DefaultInfosEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] = entity.response.toJson();
	return data;
}

DefaultInfosHeader $DefaultInfosHeaderFromJson(Map<String, dynamic> json) {
	final DefaultInfosHeader defaultInfosHeader = DefaultInfosHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		defaultInfosHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		defaultInfosHeader.message = message;
	}
	return defaultInfosHeader;
}

Map<String, dynamic> $DefaultInfosHeaderToJson(DefaultInfosHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	return data;
}

DefaultInfosResponse $DefaultInfosResponseFromJson(Map<String, dynamic> json) {
	final DefaultInfosResponse defaultInfosResponse = DefaultInfosResponse();
	final String? cgu = jsonConvert.convert<String>(json['cgu']);
	if (cgu != null) {
		defaultInfosResponse.cgu = cgu;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		defaultInfosResponse.version = version;
	}
	final String? telephone = jsonConvert.convert<String>(json['telephone']);
	if (telephone != null) {
		defaultInfosResponse.telephone = telephone;
	}
	final int? versionAndroid = jsonConvert.convert<int>(json['version_android']);
	if (versionAndroid != null) {
		defaultInfosResponse.versionAndroid = versionAndroid;
	}
	final bool? blocked = jsonConvert.convert<bool>(json['blocked']);
	if (blocked != null) {
		defaultInfosResponse.blocked = blocked;
	}
	final List<DefaultInfosResponseStations>? stations = jsonConvert.convertListNotNull<DefaultInfosResponseStations>(json['stations']);
	if (stations != null) {
		defaultInfosResponse.stations = stations;
	}
	final List<String>? carburants = jsonConvert.convertListNotNull<String>(json['carburants']);
	if (carburants != null) {
		defaultInfosResponse.carburants = carburants;
	}
	final List<String>? services = jsonConvert.convertListNotNull<String>(json['services']);
	if (services != null) {
		defaultInfosResponse.services = services;
	}
	final List<DefaultInfosResponseMarquevehicules>? marquevehicules = jsonConvert.convertListNotNull<DefaultInfosResponseMarquevehicules>(json['marquevehicules']);
	if (marquevehicules != null) {
		defaultInfosResponse.marquevehicules = marquevehicules;
	}
	return defaultInfosResponse;
}

Map<String, dynamic> $DefaultInfosResponseToJson(DefaultInfosResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['cgu'] = entity.cgu;
	data['version'] = entity.version;
	data['telephone'] = entity.telephone;
	data['version_android'] = entity.versionAndroid;
	data['blocked'] = entity.blocked;
	data['stations'] =  entity.stations.map((v) => v.toJson()).toList();
	data['carburants'] =  entity.carburants;
	data['services'] =  entity.services;
	data['marquevehicules'] =  entity.marquevehicules.map((v) => v.toJson()).toList();
	return data;
}

DefaultInfosResponseStations $DefaultInfosResponseStationsFromJson(Map<String, dynamic> json) {
	final DefaultInfosResponseStations defaultInfosResponseStations = DefaultInfosResponseStations();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		defaultInfosResponseStations.id = id;
	}
	final String? nom = jsonConvert.convert<String>(json['nom']);
	if (nom != null) {
		defaultInfosResponseStations.nom = nom;
	}
	final String? longitude = jsonConvert.convert<String>(json['longitude']);
	if (longitude != null) {
		defaultInfosResponseStations.longitude = longitude;
	}
	final String? latitude = jsonConvert.convert<String>(json['latitude']);
	if (latitude != null) {
		defaultInfosResponseStations.latitude = latitude;
	}
	final String? adresse = jsonConvert.convert<String>(json['adresse']);
	if (adresse != null) {
		defaultInfosResponseStations.adresse = adresse;
	}
	final String? lavage = jsonConvert.convert<String>(json['lavage']);
	if (lavage != null) {
		defaultInfosResponseStations.lavage = lavage;
	}
	final String? restaurant = jsonConvert.convert<String>(json['restaurant']);
	if (restaurant != null) {
		defaultInfosResponseStations.restaurant = restaurant;
	}
	final String? cafe = jsonConvert.convert<String>(json['cafe']);
	if (cafe != null) {
		defaultInfosResponseStations.cafe = cafe;
	}
	final String? shop = jsonConvert.convert<String>(json['shop']);
	if (shop != null) {
		defaultInfosResponseStations.shop = shop;
	}
	final String? vidange = jsonConvert.convert<String>(json['vidange']);
	if (vidange != null) {
		defaultInfosResponseStations.vidange = vidange;
	}
	final String? entretien = jsonConvert.convert<String>(json['entretien']);
	if (entretien != null) {
		defaultInfosResponseStations.entretien = entretien;
	}
	final String? ville = jsonConvert.convert<String>(json['ville']);
	if (ville != null) {
		defaultInfosResponseStations.ville = ville;
	}
	final String? tpe = jsonConvert.convert<String>(json['tpe']);
	if (tpe != null) {
		defaultInfosResponseStations.tpe = tpe;
	}
	final String? card = jsonConvert.convert<String>(json['card']);
	if (card != null) {
		defaultInfosResponseStations.card = card;
	}
	final String? prixGasoil = jsonConvert.convert<String>(json['prixGasoil']);
	if (prixGasoil != null) {
		defaultInfosResponseStations.prixGasoil = prixGasoil;
	}
	final String? prixSSP = jsonConvert.convert<String>(json['prixSSP']);
	if (prixSSP != null) {
		defaultInfosResponseStations.prixSSP = prixSSP;
	}
	final String? tel = jsonConvert.convert<String>(json['tel']);
	if (tel != null) {
		defaultInfosResponseStations.tel = tel;
	}
	final String? melange = jsonConvert.convert<String>(json['melange']);
	if (melange != null) {
		defaultInfosResponseStations.melange = melange;
	}
	final String? elephant = jsonConvert.convert<String>(json['elephant']);
	if (elephant != null) {
		defaultInfosResponseStations.elephant = elephant;
	}
	final String? distance = jsonConvert.convert<String>(json['distance']);
	if (distance != null) {
		defaultInfosResponseStations.distance = distance;
	}
	final String? datePrix = jsonConvert.convert<String>(json['date_prix']);
	if (datePrix != null) {
		defaultInfosResponseStations.datePrix = datePrix;
	}
	final String? vERSION = jsonConvert.convert<String>(json['VERSION']);
	if (vERSION != null) {
		defaultInfosResponseStations.vERSION = vERSION;
	}
	return defaultInfosResponseStations;
}

Map<String, dynamic> $DefaultInfosResponseStationsToJson(DefaultInfosResponseStations entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['nom'] = entity.nom;
	data['longitude'] = entity.longitude;
	data['latitude'] = entity.latitude;
	data['adresse'] = entity.adresse;
	data['lavage'] = entity.lavage;
	data['restaurant'] = entity.restaurant;
	data['cafe'] = entity.cafe;
	data['shop'] = entity.shop;
	data['vidange'] = entity.vidange;
	data['entretien'] = entity.entretien;
	data['ville'] = entity.ville;
	data['tpe'] = entity.tpe;
	data['card'] = entity.card;
	data['prixGasoil'] = entity.prixGasoil;
	data['prixSSP'] = entity.prixSSP;
	data['tel'] = entity.tel;
	data['melange'] = entity.melange;
	data['elephant'] = entity.elephant;
	data['distance'] = entity.distance;
	data['date_prix'] = entity.datePrix;
	data['VERSION'] = entity.vERSION;
	return data;
}

DefaultInfosResponseMarquevehicules $DefaultInfosResponseMarquevehiculesFromJson(Map<String, dynamic> json) {
	final DefaultInfosResponseMarquevehicules defaultInfosResponseMarquevehicules = DefaultInfosResponseMarquevehicules();
	final String? nom = jsonConvert.convert<String>(json['nom']);
	if (nom != null) {
		defaultInfosResponseMarquevehicules.nom = nom;
	}
	final List<String>? marque = jsonConvert.convertListNotNull<String>(json['marque']);
	if (marque != null) {
		defaultInfosResponseMarquevehicules.marque = marque;
	}
	return defaultInfosResponseMarquevehicules;
}

Map<String, dynamic> $DefaultInfosResponseMarquevehiculesToJson(DefaultInfosResponseMarquevehicules entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['nom'] = entity.nom;
	data['marque'] =  entity.marque;
	return data;
}