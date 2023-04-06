import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/deletcar_entity.dart';

DeletcarEntity $DeletcarEntityFromJson(Map<String, dynamic> json) {
	final DeletcarEntity deletcarEntity = DeletcarEntity();
	final DeletcarHeader? header = jsonConvert.convert<DeletcarHeader>(json['header']);
	if (header != null) {
		deletcarEntity.header = header;
	}
	final dynamic? response = jsonConvert.convert<dynamic>(json['response']);
	if (response != null) {
		deletcarEntity.response = response;
	}
	return deletcarEntity;
}

Map<String, dynamic> $DeletcarEntityToJson(DeletcarEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] = entity.response;
	return data;
}

DeletcarHeader $DeletcarHeaderFromJson(Map<String, dynamic> json) {
	final DeletcarHeader deletcarHeader = DeletcarHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		deletcarHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		deletcarHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		deletcarHeader.messageAr = messageAr;
	}
	return deletcarHeader;
}

Map<String, dynamic> $DeletcarHeaderToJson(DeletcarHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}