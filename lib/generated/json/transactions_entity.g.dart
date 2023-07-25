import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/transactions_entity.dart';

TransactionsEntity $TransactionsEntityFromJson(Map<String, dynamic> json) {
	final TransactionsEntity transactionsEntity = TransactionsEntity();
	final String? nUM = jsonConvert.convert<String>(json['NUM']);
	if (nUM != null) {
		transactionsEntity.nUM = nUM;
	}
	final String? pAN = jsonConvert.convert<String>(json['PAN']);
	if (pAN != null) {
		transactionsEntity.pAN = pAN;
	}
	final String? nOM = jsonConvert.convert<String>(json['NOM']);
	if (nOM != null) {
		transactionsEntity.nOM = nOM;
	}
	final String? mAT = jsonConvert.convert<String>(json['MAT']);
	if (mAT != null) {
		transactionsEntity.mAT = mAT;
	}
	final String? dH = jsonConvert.convert<String>(json['DH']);
	if (dH != null) {
		transactionsEntity.dH = dH;
	}
	final String? sTATION = jsonConvert.convert<String>(json['STATION']);
	if (sTATION != null) {
		transactionsEntity.sTATION = sTATION;
	}
	final String? c = jsonConvert.convert<String>(json['C']);
	if (c != null) {
		transactionsEntity.c = c;
	}
	final String? p = jsonConvert.convert<String>(json['P']);
	if (p != null) {
		transactionsEntity.p = p;
	}
	final String? q = jsonConvert.convert<String>(json['Q']);
	if (q != null) {
		transactionsEntity.q = q;
	}
	final String? m = jsonConvert.convert<String>(json['M']);
	if (m != null) {
		transactionsEntity.m = m;
	}
	final String? k = jsonConvert.convert<String>(json['K']);
	if (k != null) {
		transactionsEntity.k = k;
	}
	final String? mODE = jsonConvert.convert<String>(json['MODE']);
	if (mODE != null) {
		transactionsEntity.mODE = mODE;
	}
	return transactionsEntity;
}

Map<String, dynamic> $TransactionsEntityToJson(TransactionsEntity entity) {
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