import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/transactions_entity.g.dart';

@JsonSerializable()
class TransactionsEntity {

	@JSONField(name: "NUM")
	late String nUM;
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
	late String q;
	@JSONField(name: "M")
	late String m;
	@JSONField(name: "K")
	late String k;
	@JSONField(name: "MODE")
	late String mODE;
  
  TransactionsEntity();

  factory TransactionsEntity.fromJson(Map<String, dynamic> json) => $TransactionsEntityFromJson(json);

  Map<String, dynamic> toJson() => $TransactionsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}