import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/transactions_entity.g.dart';

@JsonSerializable()
class TransactionsEntity {

	late TransactionsHeader header;
	late List<TransactionsResponse> response;
  
  TransactionsEntity();

  factory TransactionsEntity.fromJson(Map<String, dynamic> json) => $TransactionsEntityFromJson(json);

  Map<String, dynamic> toJson() => $TransactionsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TransactionsHeader {

	late int status;
	late String message;
	late String messageAr;
  
  TransactionsHeader();

  factory TransactionsHeader.fromJson(Map<String, dynamic> json) => $TransactionsHeaderFromJson(json);

  Map<String, dynamic> toJson() => $TransactionsHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TransactionsResponse {

	@JSONField(name: "NUM")
	late int nUM;
	@JSONField(name: "PAN")
	late String pAN;
	@JSONField(name: "NOM")
	late String nOM;
	@JSONField(name: "MAT")
	late String mAT;
	@JSONField(name: "DH")
	late String dH;
	@JSONField(name: "STATION")
	late String sTATION;
	@JSONField(name: "C")
	late String c;
	@JSONField(name: "P")
	late String p;
	@JSONField(name: "Q")
	late double q;
	@JSONField(name: "M")
	late double m;
	@JSONField(name: "K")
	late String k;
	@JSONField(name: "MODE")
	late String mODE;
  
  TransactionsResponse();

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) => $TransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => $TransactionsResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}