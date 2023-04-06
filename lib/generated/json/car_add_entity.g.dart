import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/car_add_entity.dart';

CarAddEntity $CarAddEntityFromJson(Map<String, dynamic> json) {
	final CarAddEntity carAddEntity = CarAddEntity();
	final CarAddHeader? header = jsonConvert.convert<CarAddHeader>(json['header']);
	if (header != null) {
		carAddEntity.header = header;
	}
	final dynamic? response = jsonConvert.convert<dynamic>(json['response']);
	if (response != null) {
		carAddEntity.response = response;
	}
	return carAddEntity;
}

Map<String, dynamic> $CarAddEntityToJson(CarAddEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] = entity.response;
	return data;
}

CarAddHeader $CarAddHeaderFromJson(Map<String, dynamic> json) {
	final CarAddHeader carAddHeader = CarAddHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		carAddHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		carAddHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		carAddHeader.messageAr = messageAr;
	}
	return carAddHeader;
}

Map<String, dynamic> $CarAddHeaderToJson(CarAddHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}