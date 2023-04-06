import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/deletealerte_entity.dart';

DeletealerteEntity $DeletealerteEntityFromJson(Map<String, dynamic> json) {
	final DeletealerteEntity deletealerteEntity = DeletealerteEntity();
	final DeletealerteHeader? header = jsonConvert.convert<DeletealerteHeader>(json['header']);
	if (header != null) {
		deletealerteEntity.header = header;
	}
	final List<dynamic>? response = jsonConvert.convertListNotNull<dynamic>(json['response']);
	if (response != null) {
		deletealerteEntity.response = response;
	}
	return deletealerteEntity;
}

Map<String, dynamic> $DeletealerteEntityToJson(DeletealerteEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response;
	return data;
}

DeletealerteHeader $DeletealerteHeaderFromJson(Map<String, dynamic> json) {
	final DeletealerteHeader deletealerteHeader = DeletealerteHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		deletealerteHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		deletealerteHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		deletealerteHeader.messageAr = messageAr;
	}
	return deletealerteHeader;
}

Map<String, dynamic> $DeletealerteHeaderToJson(DeletealerteHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}