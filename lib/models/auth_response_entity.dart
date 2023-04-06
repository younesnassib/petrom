import 'dart:convert';
import 'package:petrom_fidelite/generated/json/base/json_field.dart';
import 'package:petrom_fidelite/generated/json/auth_response_entity.g.dart';

@JsonSerializable()
class AuthResponseEntity {

	late AuthResponseHeader header;
	late AuthResponseResponse response;
  
  AuthResponseEntity();

  factory AuthResponseEntity.fromJson(Map<String, dynamic> json) => $AuthResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseHeader {

	late int status;
	late String message;
	late String messageAr;
  
  AuthResponseHeader();

  factory AuthResponseHeader.fromJson(Map<String, dynamic> json) => $AuthResponseHeaderFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseHeaderToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseResponse {

	late String id;
	late String username;
	late String civilite;
	late String nom;
	late String prenom;
	@JSONField(name: "id_module_profile")
	late String idModuleProfile;
	late String email;
	late String tel;
	@JSONField(name: "id_parent")
	late String idParent;
	@JSONField(name: "date_activation")
	late String dateActivation;
	late String actif;
	@JSONField(name: "login_last_login")
	late String loginLastLogin;
	late String type;
	late AuthResponseResponseClient client;
	@JSONField(name: "NCarte")
	late String nCarte;
	late List<AuthResponseResponseDashboard> dashboard;
  
  AuthResponseResponse();

  factory AuthResponseResponse.fromJson(Map<String, dynamic> json) => $AuthResponseResponseFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseResponseClient {

	@JSONField(name: "id_compte")
	late String idCompte;
	@JSONField(name: "id_client_pcard")
	late String idClientPcard;
	@JSONField(name: "id_tavl")
	late String idTavl;
	@JSONField(name: "code_sap")
	late String codeSap;
	late String libelle;
	@JSONField(name: "date_insert")
	late String dateInsert;
	@JSONField(name: "user_insert")
	late String userInsert;
	@JSONField(name: "id_user_compte")
	late String idUserCompte;
	@JSONField(name: "data_creation")
	late String dataCreation;
	late String communication;
	late String statut;
  
  AuthResponseResponseClient();

  factory AuthResponseResponseClient.fromJson(Map<String, dynamic> json) => $AuthResponseResponseClientFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseResponseClientToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthResponseResponseDashboard {

	late String titleFr;
	late String titleAr;
	late String bgColor;
	late String valueFr;
	late String valueAr;
	late String url;
	late String icon;
  
  AuthResponseResponseDashboard();

  factory AuthResponseResponseDashboard.fromJson(Map<String, dynamic> json) => $AuthResponseResponseDashboardFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseResponseDashboardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}