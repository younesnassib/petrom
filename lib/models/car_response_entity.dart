import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/car_response_entity.g.dart';

@JsonSerializable()
class CarResponseEntity {

	late double id;
	@JSONField(name: "user_id")
	late double userId;
	late String matricule;
	String libelle="";
	late String marque;
	late String modele;
	late String motorisation;
	late String carburant;
	@JSONField(name: "pan_carte")
	late String panCarte;
	late String reservoir="0";
	@JSONField(name: "cons_min")
	dynamic consMin;
	@JSONField(name: "cons_max")
	dynamic consMax;
	@JSONField(name: "km_init")
	dynamic kmInit;
	@JSONField(name: "km_courant")
	late double kmCourant=0;
	late String status;
	dynamic nfc;
	@JSONField(name: "created_at")
	late String createdAt;
	@JSONField(name: "updated_at")
	late String updatedAt;
  
  CarResponseEntity();

  factory CarResponseEntity.fromJson(Map<String, dynamic> json) => $CarResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CarResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}