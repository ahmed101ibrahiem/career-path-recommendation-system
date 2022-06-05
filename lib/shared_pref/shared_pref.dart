import 'dart:convert';

import 'package:pharus/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveUserData(UserModel userModel) async {
    await prefs.setString('user', jsonEncode(userModel.toJson()));
  }

  getUserData() {
    UserModel userModel;
    if (prefs.getString('user') == null) {
      return null;
    }
    userModel = UserModel.fromJson(jsonDecode(prefs.getString('user')));
    return userModel;
  }

  deleteUser() async {
    await prefs.remove('user');
  }
}
