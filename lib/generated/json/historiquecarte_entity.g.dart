import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/historiquecarte_entity.dart';

HistoriquecarteEntity $HistoriquecarteEntityFromJson(Map<String, dynamic> json) {
	final HistoriquecarteEntity historiquecarteEntity = HistoriquecarteEntity();
	final String? c = jsonConvert.convert<String>(json['C']);
	if (c != null) {
		historiquecarteEntity.c = c;
	}
	final String? p = jsonConvert.convert<String>(json['P']);
	if (p != null) {
		historiquecarteEntity.p = p;
	}
	final double? q = jsonConvert.convert<double>(json['Q']);
	if (q != null) {
		historiquecarteEntity.q = q;
	}
	final double? m = jsonConvert.convert<double>(json['M']);
	if (m != null) {
		historiquecarteEntity.m = m;
	}
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		historiquecarteEntity.id = id;
	}
	return historiquecarteEntity;
}

Map<String, dynamic> $HistoriquecarteEntityToJson(HistoriquecarteEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['C'] = entity.c;
	data['P'] = entity.p;
	data['Q'] = entity.q;
	data['M'] = entity.m;
	data['id'] = entity.id;
	return data;
}