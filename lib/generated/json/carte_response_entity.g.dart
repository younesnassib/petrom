import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/carte_response_entity.dart';

CarteResponseEntity $CarteResponseEntityFromJson(Map<String, dynamic> json) {
	final CarteResponseEntity carteResponseEntity = CarteResponseEntity();
	final CarteResponseHeader? header = jsonConvert.convert<CarteResponseHeader>(json['header']);
	if (header != null) {
		carteResponseEntity.header = header;
	}
	final List<CarteResponseResponse>? response = jsonConvert.convertListNotNull<CarteResponseResponse>(json['response']);
	if (response != null) {
		carteResponseEntity.response = response;
	}
	return carteResponseEntity;
}

Map<String, dynamic> $CarteResponseEntityToJson(CarteResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response.map((v) => v.toJson()).toList();
	return data;
}

CarteResponseHeader $CarteResponseHeaderFromJson(Map<String, dynamic> json) {
	final CarteResponseHeader carteResponseHeader = CarteResponseHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		carteResponseHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		carteResponseHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		carteResponseHeader.messageAr = messageAr;
	}
	return carteResponseHeader;
}

Map<String, dynamic> $CarteResponseHeaderToJson(CarteResponseHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

CarteResponseResponse $CarteResponseResponseFromJson(Map<String, dynamic> json) {
	final CarteResponseResponse carteResponseResponse = CarteResponseResponse();
	final String? pAN = jsonConvert.convert<String>(json['PAN']);
	if (pAN != null) {
		carteResponseResponse.pAN = pAN;
	}
	final String? nOM = jsonConvert.convert<String>(json['NOM']);
	if (nOM != null) {
		carteResponseResponse.nOM = nOM;
	}
	final String? vHS = jsonConvert.convert<String>(json['VHS']);
	if (vHS != null) {
		carteResponseResponse.vHS = vHS;
	}
	final bool? cheked = jsonConvert.convert<bool>(json['cheked']);
	if (cheked != null) {
		carteResponseResponse.cheked = cheked;
	}
	return carteResponseResponse;
}

Map<String, dynamic> $CarteResponseResponseToJson(CarteResponseResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['PAN'] = entity.pAN;
	data['NOM'] = entity.nOM;
	data['VHS'] = entity.vHS;
	data['cheked'] = entity.cheked;
	return data;
}