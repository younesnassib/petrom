import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/transactions_entity.dart';

TransactionsEntity $TransactionsEntityFromJson(Map<String, dynamic> json) {
	final TransactionsEntity transactionsEntity = TransactionsEntity();
	final TransactionsHeader? header = jsonConvert.convert<TransactionsHeader>(json['header']);
	if (header != null) {
		transactionsEntity.header = header;
	}
	final List<TransactionsResponse>? response = jsonConvert.convertListNotNull<TransactionsResponse>(json['response']);
	if (response != null) {
		transactionsEntity.response = response;
	}
	return transactionsEntity;
}

Map<String, dynamic> $TransactionsEntityToJson(TransactionsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] =  entity.response.map((v) => v.toJson()).toList();
	return data;
}

TransactionsHeader $TransactionsHeaderFromJson(Map<String, dynamic> json) {
	final TransactionsHeader transactionsHeader = TransactionsHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		transactionsHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		transactionsHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		transactionsHeader.messageAr = messageAr;
	}
	return transactionsHeader;
}

Map<String, dynamic> $TransactionsHeaderToJson(TransactionsHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

TransactionsResponse $TransactionsResponseFromJson(Map<String, dynamic> json) {
	final TransactionsResponse transactionsResponse = TransactionsResponse();
	final int? nUM = jsonConvert.convert<int>(json['NUM']);
	if (nUM != null) {
		transactionsResponse.nUM = nUM;
	}
	final String? pAN = jsonConvert.convert<String>(json['PAN']);
	if (pAN != null) {
		transactionsResponse.pAN = pAN;
	}
	final String? nOM = jsonConvert.convert<String>(json['NOM']);
	if (nOM != null) {
		transactionsResponse.nOM = nOM;
	}
	final String? mAT = jsonConvert.convert<String>(json['MAT']);
	if (mAT != null) {
		transactionsResponse.mAT = mAT;
	}
	final String? dH = jsonConvert.convert<String>(json['DH']);
	if (dH != null) {
		transactionsResponse.dH = dH;
	}
	final String? sTATION = jsonConvert.convert<String>(json['STATION']);
	if (sTATION != null) {
		transactionsResponse.sTATION = sTATION;
	}
	final String? c = jsonConvert.convert<String>(json['C']);
	if (c != null) {
		transactionsResponse.c = c;
	}
	final String? p = jsonConvert.convert<String>(json['P']);
	if (p != null) {
		transactionsResponse.p = p;
	}
	final double? q = jsonConvert.convert<double>(json['Q']);
	if (q != null) {
		transactionsResponse.q = q;
	}
	final double? m = jsonConvert.convert<double>(json['M']);
	if (m != null) {
		transactionsResponse.m = m;
	}
	final String? k = jsonConvert.convert<String>(json['K']);
	if (k != null) {
		transactionsResponse.k = k;
	}
	final String? mODE = jsonConvert.convert<String>(json['MODE']);
	if (mODE != null) {
		transactionsResponse.mODE = mODE;
	}
	return transactionsResponse;
}

Map<String, dynamic> $TransactionsResponseToJson(TransactionsResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['NUM'] = entity.nUM;
	data['PAN'] = entity.pAN;
	data['NOM'] = entity.nOM;
	data['MAT'] = entity.mAT;
	data['DH'] = entity.dH;
	data['STATION'] = entity.sTATION;
	data['C'] = entity.c;
	data['P'] = entity.p;
	data['Q'] = entity.q;
	data['M'] = entity.m;
	data['K'] = entity.k;
	data['MODE'] = entity.mODE;
	return data;
}