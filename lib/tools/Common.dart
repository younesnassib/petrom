import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../models/alerte_response_entity.dart';

class Common {
  static Future<String> getUniqueDeviceId() async {
    String uniqueDeviceId = '';

    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      uniqueDeviceId =
          '${iosDeviceInfo.name}:${iosDeviceInfo.identifierForVendor}'; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      uniqueDeviceId = androidDeviceInfo.id; // unique ID on Android
    }
    return uniqueDeviceId;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[200],
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static String telFormatToSend(String tel) {
    String telephone = '+212' + tel.substring(1, tel.length);
    return telephone;
  }

  static Future<void> setUserData(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', login);
    await prefs.setString('password', password);
  }

  static String getNextDateAlert(AlerteResponseEntity mAlert) {
    if (int.parse(mAlert.type) == 1) {
      DateTime dateDeclemche = toDateFormat(mAlert.dateDeclenche);
      DateTime DateNextAlerte = dateDeclemche;
      DateTime DateNow = DateTime.now();
      if (DateNow.isAfter(dateDeclemche)) {
        if (mAlert.typeFrequenceTemps.toInt() == 1) {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year,
                DateNextAlerte.month,
                DateNextAlerte.day + int.parse(mAlert.frequenceDate));
          }
        } else if (mAlert.typeFrequenceTemps.toInt() == 2) {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year,
                DateNextAlerte.month + int.parse(mAlert.frequenceDate),
                DateNextAlerte.day);
          }
        } else {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year + int.parse(mAlert.frequenceDate),
                DateNextAlerte.month,
                DateNextAlerte.day);
          }
        }

      } else {
        if (mAlert.typeFrequenceTemps.toInt() == 1) {
          DateNextAlerte = new DateTime(
              DateNextAlerte.year,
              DateNextAlerte.month,
              DateNextAlerte.day + int.parse(mAlert.frequenceDate));
        } else if (mAlert.typeFrequenceTemps.toInt() == 2) {
          DateNextAlerte = new DateTime(
              DateNextAlerte.year,
              DateNextAlerte.month + int.parse(mAlert.frequenceDate),
              DateNextAlerte.day);
        } else {
          DateNextAlerte = new DateTime(
              DateNextAlerte.year + int.parse(mAlert.frequenceDate),
              DateNextAlerte.month,
              DateNextAlerte.day);
        }
      }
      return toDateStringFormat(DateNextAlerte);
    } else {
      return (mAlert.distanceDeclenche.toInt() +
              mAlert.frequenceDistance.toInt())
          .toString();
    }
  }

  static String getLastDateAlerte(AlerteResponseEntity mAlert) {
    if (int.parse(mAlert.type) == 1) {
      DateTime dateDeclemche = toDateFormat(mAlert.dateDeclenche);
      DateTime DateNextAlerte = dateDeclemche;
      DateTime DateNow = DateTime.now();
      if (DateNow.isAfter(dateDeclemche)) {
        if (mAlert.typeFrequenceTemps.toInt() == 1) {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year,
                DateNextAlerte.month,
                DateNextAlerte.day + int.parse(mAlert.frequenceDate));
          }
          DateNextAlerte = new DateTime(
              DateNextAlerte.year,
              DateNextAlerte.month,
              DateNextAlerte.day - int.parse(mAlert.frequenceDate));
        } else if (mAlert.typeFrequenceTemps.toInt() == 2) {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year,
                DateNextAlerte.month + int.parse(mAlert.frequenceDate),
                DateNextAlerte.day);
          }
          DateNextAlerte = new DateTime(
              DateNextAlerte.year,
              DateNextAlerte.month - int.parse(mAlert.frequenceDate),
              DateNextAlerte.day);
        } else {
          while (DateNextAlerte.isBefore(DateNow)) {
            DateNextAlerte = new DateTime(
                DateNextAlerte.year + int.parse(mAlert.frequenceDate),
                DateNextAlerte.month,
                DateNextAlerte.day);
          }
          DateNextAlerte = new DateTime(
              DateNextAlerte.year - int.parse(mAlert.frequenceDate),
              DateNextAlerte.month,
              DateNextAlerte.day);
        }
        return toDateStringFormat(DateNextAlerte);
      } else
        return toDateStringFormat(dateDeclemche);
    } else {
      return mAlert.frequenceDistance.toInt().toString();
    }
  }

  static String toDateStringFormat(DateTime mAlert) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(mAlert);
    return formattedDate;
  }

  static DateTime toDateFormat(String dateDeclenche) {
    return DateTime.parse(dateDeclenche);
  }

  static int calculateDistance(double lat1,double lon1,double lat2,double lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return (12742 * asin(sqrt(a)) * 100).toInt();
  }
}
