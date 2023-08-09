import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/carte_response_entity.dart';

CarteResponseEntity $CarteResponseEntityFromJson(Map<String, dynamic> json) {
	final CarteResponseEntity carteResponseEntity = CarteResponseEntity();
	final String? pAN = jsonConvert.convert<String>(json['PAN']);
	if (pAN != null) {
		carteResponseEntity.pAN = pAN;
	}
	final String? nOM = jsonConvert.convert<String>(json['NOM']);
	if (nOM != null) {
		carteResponseEntity.nOM = nOM;
	}
	final String? nomsurlacarte = jsonConvert.convert<String>(json['nomsurlacarte']);
	if (nomsurlacarte != null) {
		carteResponseEntity.nomsurlacarte = nomsurlacarte;
	}
	final String? plafondJ = jsonConvert.convert<String>(json['plafondJ']);
	if (plafondJ != null) {
		carteResponseEntity.plafondJ = plafondJ;
	}
	final String? plafondH = jsonConvert.convert<String>(json['plafondH']);
	if (plafondH != null) {
		carteResponseEntity.plafondH = plafondH;
	}
	final String? plafondM = jsonConvert.convert<String>(json['plafondM']);
	if (plafondM != null) {
		carteResponseEntity.plafondM = plafondM;
	}
	final String? plafondHL = jsonConvert.convert<String>(json['plafondHL']);
	if (plafondHL != null) {
		carteResponseEntity.plafondHL = plafondHL;
	}
	final String? plafondJL = jsonConvert.convert<String>(json['plafondJL']);
	if (plafondJL != null) {
		carteResponseEntity.plafondJL = plafondJL;
	}
	final String? plafondML = jsonConvert.convert<String>(json['plafondML']);
	if (plafondML != null) {
		carteResponseEntity.plafondML = plafondML;
	}
	final String? listevehicules = jsonConvert.convert<String>(json['Listevehicules']);
	if (listevehicules != null) {
		carteResponseEntity.listevehicules = listevehicules;
	}
	final String? typecarte = jsonConvert.convert<String>(json['typecarte']);
	if (typecarte != null) {
		carteResponseEntity.typecarte = typecarte;
	}
	final String? listeproduit = jsonConvert.convert<String>(json['listeproduit']);
	if (listeproduit != null) {
		carteResponseEntity.listeproduit = listeproduit;
	}
	final String? idclient = jsonConvert.convert<String>(json['Idclient']);
	if (idclient != null) {
		carteResponseEntity.idclient = idclient;
	}
	final String? restrictiongeo = jsonConvert.convert<String>(json['Restrictiongeo']);
	if (restrictiongeo != null) {
		carteResponseEntity.restrictiongeo = restrictiongeo;
	}
	final String? vHS = jsonConvert.convert<String>(json['VHS']);
	if (vHS != null) {
		carteResponseEntity.vHS = vHS;
	}
	return carteResponseEntity;
}

Map<String, dynamic> $CarteResponseEntityToJson(CarteResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['PAN'] = entity.pAN;
	data['NOM'] = entity.nOM;
	data['nomsurlacarte'] = entity.nomsurlacarte;
	data['plafondJ'] = entity.plafondJ;
	data['plafondH'] = entity.plafondH;
	data['plafondM'] = entity.plafondM;
	data['plafondHL'] = entity.plafondHL;
	data['plafondJL'] = entity.plafondJL;
	data['plafondML'] = entity.plafondML;
	data['Listevehicules'] = entity.listevehicules;
	data['typecarte'] = entity.typecarte;
	data['listeproduit'] = entity.listeproduit;
	data['Idclient'] = entity.idclient;
	data['Restrictiongeo'] = entity.restrictiongeo;
	data['VHS'] = entity.vHS;
	return data;
}