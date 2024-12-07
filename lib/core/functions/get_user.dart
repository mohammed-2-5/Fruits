import 'dart:convert';

import 'package:fruits/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';
import '../services/shared_preference.dart';
import '../utils/constants.dart';

UserEntity getData() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntity;
}
