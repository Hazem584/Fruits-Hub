import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fruits_e_commerce/core/helper/constants.dart';
import 'package:fruits_e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_entity.dart';
import 'package:fruits_e_commerce/features/auth/data/model/user_model.dart';

UserEntity? getUser() {
  try {
    var jsonString = Prefs.getString(kUserData);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    var decodedJson = jsonDecode(jsonString);
    var userEntity = UserModel.fromJson(decodedJson);
    return userEntity;
  } catch (e) {
    if (kDebugMode) {
      print('Error parsing user data: $e');
    }
    return null;
  }
}

bool isUserLoggedIn() {
  return getUser() != null;
}

UserEntity getUserOrDefault() {
  return getUser() ?? UserEntity(name: '', email: '', uId: '');
}
