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
	final String? vHS = jsonConvert.convert<String>(json['VHS']);
	if (vHS != null) {
		carteResponseEntity.vHS = vHS;
	}
	final bool? cheked = jsonConvert.convert<bool>(json['cheked']);
	if (cheked != null) {
		carteResponseEntity.cheked = cheked;
	}
	return carteResponseEntity;
}

Map<String, dynamic> $CarteResponseEntityToJson(CarteResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['PAN'] = entity.pAN;
	data['NOM'] = entity.nOM;
	data['VHS'] = entity.vHS;
	data['cheked'] = entity.cheked;
	return data;
}