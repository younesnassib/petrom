import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/auth_response_entity.dart';

AuthResponseEntity $AuthResponseEntityFromJson(Map<String, dynamic> json) {
	final AuthResponseEntity authResponseEntity = AuthResponseEntity();
	final AuthResponseHeader? header = jsonConvert.convert<AuthResponseHeader>(json['header']);
	if (header != null) {
		authResponseEntity.header = header;
	}
	final AuthResponseResponse? response = jsonConvert.convert<AuthResponseResponse>(json['response']);
	if (response != null) {
		authResponseEntity.response = response;
	}
	return authResponseEntity;
}

Map<String, dynamic> $AuthResponseEntityToJson(AuthResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['header'] = entity.header.toJson();
	data['response'] = entity.response.toJson();
	return data;
}

AuthResponseHeader $AuthResponseHeaderFromJson(Map<String, dynamic> json) {
	final AuthResponseHeader authResponseHeader = AuthResponseHeader();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		authResponseHeader.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		authResponseHeader.message = message;
	}
	final String? messageAr = jsonConvert.convert<String>(json['messageAr']);
	if (messageAr != null) {
		authResponseHeader.messageAr = messageAr;
	}
	return authResponseHeader;
}

Map<String, dynamic> $AuthResponseHeaderToJson(AuthResponseHeader entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['messageAr'] = entity.messageAr;
	return data;
}

AuthResponseResponse $AuthResponseResponseFromJson(Map<String, dynamic> json) {
	final AuthResponseResponse authResponseResponse = AuthResponseResponse();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		authResponseResponse.id = id;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		authResponseResponse.username = username;
	}
	final String? civilite = jsonConvert.convert<String>(json['civilite']);
	if (civilite != null) {
		authResponseResponse.civilite = civilite;
	}
	final String? nom = jsonConvert.convert<String>(json['nom']);
	if (nom != null) {
		authResponseResponse.nom = nom;
	}
	final String? prenom = jsonConvert.convert<String>(json['prenom']);
	if (prenom != null) {
		authResponseResponse.prenom = prenom;
	}
	final String? idModuleProfile = jsonConvert.convert<String>(json['id_module_profile']);
	if (idModuleProfile != null) {
		authResponseResponse.idModuleProfile = idModuleProfile;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		authResponseResponse.email = email;
	}
	final String? tel = jsonConvert.convert<String>(json['tel']);
	if (tel != null) {
		authResponseResponse.tel = tel;
	}
	final String? idParent = jsonConvert.convert<String>(json['id_parent']);
	if (idParent != null) {
		authResponseResponse.idParent = idParent;
	}
	final String? dateActivation = jsonConvert.convert<String>(json['date_activation']);
	if (dateActivation != null) {
		authResponseResponse.dateActivation = dateActivation;
	}
	final String? actif = jsonConvert.convert<String>(json['actif']);
	if (actif != null) {
		authResponseResponse.actif = actif;
	}
	final String? loginLastLogin = jsonConvert.convert<String>(json['login_last_login']);
	if (loginLastLogin != null) {
		authResponseResponse.loginLastLogin = loginLastLogin;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		authResponseResponse.type = type;
	}
	final AuthResponseResponseClient? client = jsonConvert.convert<AuthResponseResponseClient>(json['client']);
	if (client != null) {
		authResponseResponse.client = client;
	}
	final String? nCarte = jsonConvert.convert<String>(json['NCarte']);
	if (nCarte != null) {
		authResponseResponse.nCarte = nCarte;
	}
	final List<AuthResponseResponseDashboard>? dashboard = jsonConvert.convertListNotNull<AuthResponseResponseDashboard>(json['dashboard']);
	if (dashboard != null) {
		authResponseResponse.dashboard = dashboard;
	}
	return authResponseResponse;
}

Map<String, dynamic> $AuthResponseResponseToJson(AuthResponseResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['civilite'] = entity.civilite;
	data['nom'] = entity.nom;
	data['prenom'] = entity.prenom;
	data['id_module_profile'] = entity.idModuleProfile;
	data['email'] = entity.email;
	data['tel'] = entity.tel;
	data['id_parent'] = entity.idParent;
	data['date_activation'] = entity.dateActivation;
	data['actif'] = entity.actif;
	data['login_last_login'] = entity.loginLastLogin;
	data['type'] = entity.type;
	data['client'] = entity.client.toJson();
	data['NCarte'] = entity.nCarte;
	data['dashboard'] =  entity.dashboard.map((v) => v.toJson()).toList();
	return data;
}

AuthResponseResponseClient $AuthResponseResponseClientFromJson(Map<String, dynamic> json) {
	final AuthResponseResponseClient authResponseResponseClient = AuthResponseResponseClient();
	final String? idCompte = jsonConvert.convert<String>(json['id_compte']);
	if (idCompte != null) {
		authResponseResponseClient.idCompte = idCompte;
	}
	final String? idClientPcard = jsonConvert.convert<String>(json['id_client_pcard']);
	if (idClientPcard != null) {
		authResponseResponseClient.idClientPcard = idClientPcard;
	}
	final String? idTavl = jsonConvert.convert<String>(json['id_tavl']);
	if (idTavl != null) {
		authResponseResponseClient.idTavl = idTavl;
	}
	final String? codeSap = jsonConvert.convert<String>(json['code_sap']);
	if (codeSap != null) {
		authResponseResponseClient.codeSap = codeSap;
	}
	final String? libelle = jsonConvert.convert<String>(json['libelle']);
	if (libelle != null) {
		authResponseResponseClient.libelle = libelle;
	}
	final String? dateInsert = jsonConvert.convert<String>(json['date_insert']);
	if (dateInsert != null) {
		authResponseResponseClient.dateInsert = dateInsert;
	}
	final String? userInsert = jsonConvert.convert<String>(json['user_insert']);
	if (userInsert != null) {
		authResponseResponseClient.userInsert = userInsert;
	}
	final String? idUserCompte = jsonConvert.convert<String>(json['id_user_compte']);
	if (idUserCompte != null) {
		authResponseResponseClient.idUserCompte = idUserCompte;
	}
	final String? dataCreation = jsonConvert.convert<String>(json['data_creation']);
	if (dataCreation != null) {
		authResponseResponseClient.dataCreation = dataCreation;
	}
	final String? communication = jsonConvert.convert<String>(json['communication']);
	if (communication != null) {
		authResponseResponseClient.communication = communication;
	}
	final String? statut = jsonConvert.convert<String>(json['statut']);
	if (statut != null) {
		authResponseResponseClient.statut = statut;
	}
	return authResponseResponseClient;
}

Map<String, dynamic> $AuthResponseResponseClientToJson(AuthResponseResponseClient entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id_compte'] = entity.idCompte;
	data['id_client_pcard'] = entity.idClientPcard;
	data['id_tavl'] = entity.idTavl;
	data['code_sap'] = entity.codeSap;
	data['libelle'] = entity.libelle;
	data['date_insert'] = entity.dateInsert;
	data['user_insert'] = entity.userInsert;
	data['id_user_compte'] = entity.idUserCompte;
	data['data_creation'] = entity.dataCreation;
	data['communication'] = entity.communication;
	data['statut'] = entity.statut;
	return data;
}

AuthResponseResponseDashboard $AuthResponseResponseDashboardFromJson(Map<String, dynamic> json) {
	final AuthResponseResponseDashboard authResponseResponseDashboard = AuthResponseResponseDashboard();
	final String? titleFr = jsonConvert.convert<String>(json['titleFr']);
	if (titleFr != null) {
		authResponseResponseDashboard.titleFr = titleFr;
	}
	final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
	if (titleAr != null) {
		authResponseResponseDashboard.titleAr = titleAr;
	}
	final String? bgColor = jsonConvert.convert<String>(json['bgColor']);
	if (bgColor != null) {
		authResponseResponseDashboard.bgColor = bgColor;
	}
	final String? valueFr = jsonConvert.convert<String>(json['valueFr']);
	if (valueFr != null) {
		authResponseResponseDashboard.valueFr = valueFr;
	}
	final String? valueAr = jsonConvert.convert<String>(json['valueAr']);
	if (valueAr != null) {
		authResponseResponseDashboard.valueAr = valueAr;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		authResponseResponseDashboard.url = url;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		authResponseResponseDashboard.icon = icon;
	}
	return authResponseResponseDashboard;
}

Map<String, dynamic> $AuthResponseResponseDashboardToJson(AuthResponseResponseDashboard entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['titleFr'] = entity.titleFr;
	data['titleAr'] = entity.titleAr;
	data['bgColor'] = entity.bgColor;
	data['valueFr'] = entity.valueFr;
	data['valueAr'] = entity.valueAr;
	data['url'] = entity.url;
	data['icon'] = entity.icon;
	return data;
}