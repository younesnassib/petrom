import 'package:petrom_fidelite/generated/json/base/json_convert_content.dart';
import 'package:petrom_fidelite/models/auth_response_entity.dart';

AuthResponseEntity $AuthResponseEntityFromJson(Map<String, dynamic> json) {
	final AuthResponseEntity authResponseEntity = AuthResponseEntity();
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		authResponseEntity.status = status;
	}
	final dynamic? message = jsonConvert.convert<dynamic>(json['message']);
	if (message != null) {
		authResponseEntity.message = message;
	}
	final AuthResponseData? data = jsonConvert.convert<AuthResponseData>(json['data']);
	if (data != null) {
		authResponseEntity.data = data;
	}
	return authResponseEntity;
}

Map<String, dynamic> $AuthResponseEntityToJson(AuthResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data.toJson();
	return data;
}

AuthResponseData $AuthResponseDataFromJson(Map<String, dynamic> json) {
	final AuthResponseData authResponseData = AuthResponseData();
	final AuthResponseDataUser? user = jsonConvert.convert<AuthResponseDataUser>(json['user']);
	if (user != null) {
		authResponseData.user = user;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		authResponseData.token = token;
	}
	return authResponseData;
}

Map<String, dynamic> $AuthResponseDataToJson(AuthResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['user'] = entity.user.toJson();
	data['token'] = entity.token;
	return data;
}

AuthResponseDataUser $AuthResponseDataUserFromJson(Map<String, dynamic> json) {
	final AuthResponseDataUser authResponseDataUser = AuthResponseDataUser();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		authResponseDataUser.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		authResponseDataUser.email = email;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		authResponseDataUser.phone = phone;
	}
	final String? codeSap = jsonConvert.convert<String>(json['code_sap']);
	if (codeSap != null) {
		authResponseDataUser.codeSap = codeSap;
	}
	final String? deviceId = jsonConvert.convert<String>(json['device_id']);
	if (deviceId != null) {
		authResponseDataUser.deviceId = deviceId;
	}
	final dynamic? deviceIdSecond = jsonConvert.convert<dynamic>(json['device_id_second']);
	if (deviceIdSecond != null) {
		authResponseDataUser.deviceIdSecond = deviceIdSecond;
	}
	final String? dateBirth = jsonConvert.convert<String>(json['date_birth']);
	if (dateBirth != null) {
		authResponseDataUser.dateBirth = dateBirth;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		authResponseDataUser.gender = gender;
	}
	final String? city = jsonConvert.convert<String>(json['city']);
	if (city != null) {
		authResponseDataUser.city = city;
	}
	final String? adresse = jsonConvert.convert<String>(json['adresse']);
	if (adresse != null) {
		authResponseDataUser.adresse = adresse;
	}
	final String? profession = jsonConvert.convert<String>(json['profession']);
	if (profession != null) {
		authResponseDataUser.profession = profession;
	}
	final String? compteId = jsonConvert.convert<String>(json['compte_id']);
	if (compteId != null) {
		authResponseDataUser.compteId = compteId;
	}
	final dynamic? emailVerifiedAt = jsonConvert.convert<dynamic>(json['email_verified_at']);
	if (emailVerifiedAt != null) {
		authResponseDataUser.emailVerifiedAt = emailVerifiedAt;
	}
	final String? activatedAt = jsonConvert.convert<String>(json['activated_at']);
	if (activatedAt != null) {
		authResponseDataUser.activatedAt = activatedAt;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		authResponseDataUser.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		authResponseDataUser.updatedAt = updatedAt;
	}
	return authResponseDataUser;
}

Map<String, dynamic> $AuthResponseDataUserToJson(AuthResponseDataUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	data['code_sap'] = entity.codeSap;
	data['device_id'] = entity.deviceId;
	data['device_id_second'] = entity.deviceIdSecond;
	data['date_birth'] = entity.dateBirth;
	data['gender'] = entity.gender;
	data['city'] = entity.city;
	data['adresse'] = entity.adresse;
	data['profession'] = entity.profession;
	data['compte_id'] = entity.compteId;
	data['email_verified_at'] = entity.emailVerifiedAt;
	data['activated_at'] = entity.activatedAt;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}