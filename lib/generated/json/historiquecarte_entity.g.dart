import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/historiquecarte_entity.dart';

HistoriquecarteEntity $HistoriquecarteEntityFromJson(Map<String, dynamic> json) {
	final HistoriquecarteEntity historiquecarteEntity = HistoriquecarteEntity();
	final HistoriquecarteHeader? header = jsonConvert.convert<HistoriquecarteHeader>(json['header']);
	if (header != null) {
		historiquecarteEntity.header = header;
	}
	final List<HistoriquecarteResponse>? response = jsonConvert.convertListNotNull<HistoriquecarteResponse>(json['response']);
	if (response != null) {
		historiquecarteEntity.response = response;
	}
	return historiquecarteEntity;
}

Map<String, dynamic> $HistoriquecarteEntityToJson(HistoriquecarteEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response.map((v) => v.toJson()).toList();
	return data;
}

HistoriquecarteHeader $HistoriquecarteHeaderFromJson(Map<String, dynamic> json) {
	final HistoriquecarteHeader historiquecarteHeader = HistoriquecarteHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		historiquecarteHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		historiquecarteHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		historiquecarteHeader.messageAr = messageAr;
	}
	return historiquecarteHeader;
}

Map<String, dynamic> $HistoriquecarteHeaderToJson(HistoriquecarteHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

HistoriquecarteResponse $HistoriquecarteResponseFromJson(Map<String, dynamic> json) {
	final HistoriquecarteResponse historiquecarteResponse = HistoriquecarteResponse();
	final String? c = jsonConvert.convert<String>(json['C']);
	if (c != null) {
		historiquecarteResponse.c = c;
	}
	final String? p = jsonConvert.convert<String>(json['P']);
	if (p != null) {
		historiquecarteResponse.p = p;
	}
	final double? q = jsonConvert.convert<double>(json['Q']);
	if (q != null) {
		historiquecarteResponse.q = q;
	}
	final double? m = jsonConvert.convert<double>(json['M']);
	if (m != null) {
		historiquecarteResponse.m = m;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		historiquecarteResponse.id = id;
	}
	return historiquecarteResponse;
}

Map<String, dynamic> $HistoriquecarteResponseToJson(HistoriquecarteResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['C'] = entity.c;
	data['P'] = entity.p;
	data['Q'] = entity.q;
	data['M'] = entity.m;
	data['id'] = entity.id;
	return data;
}