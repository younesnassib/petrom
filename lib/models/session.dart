import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:petrom_fidelite/models/Enseigne.dart';
import 'package:petrom_fidelite/models/auth_response_entity.dart';
import 'package:petrom_fidelite/models/default_infos_entity.dart';
import 'package:petrom_fidelite/models/product.dart';

import 'carte_response_entity.dart';

class Session {
  static  DefaultInfosEntity informations=new DefaultInfosEntity();
  static late AuthResponseEntity infosUser;
  static late CarteResponseEntity cardsuser;
  static late List<Product> products;
  static List<Lubrifiant> lubrifiants =[];
  static List<Enseigne> enseignes =[];

  static generateMd5(String data) {
    var bytesToHash = utf8.encode(data);
    var md5Digest = md5.convert(bytesToHash);
    return md5Digest;
  }
}
