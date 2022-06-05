import 'package:flutter/cupertino.dart';
import 'package:pharus/models/user_model.dart';
import 'package:pharus/my_dio/my_dio.dart';
import 'package:pharus/shared_pref/shared_pref.dart';
import 'package:pharus/ui/screens/login.dart';
import 'package:pharus/ui/screens/success.dart';
import 'package:pharus/ui/screens/success2.dart';
import 'package:pharus/ui/widgets/snac.dart';

class AuthController extends ChangeNotifier {
  SharedPref sharedPref = SharedPref();
  UserModel userModel;
  register(UserModel userModel, context) async {
    final response =
        await MyDio.postData('authsignup', myModel: userModel.toJson());

    if (response.error == false) {
      sharedPref.saveUserData(userModel);
      Navigator.pushReplacementNamed(context, Success.id);
    } else if (response.error == true) {
      showSnac(response.errorMessage, context);
    }
  }

  login(String userName, String password, context) async {
    final response = await MyDio.postData('authlogin',
        myModel: {"username": userName, "password": password});

    if (response.error == false) {
      sharedPref.saveUserData(userModel);
      Navigator.pushReplacementNamed(context, SuccessTwo.id);
    } else if (response.error == true) {
      showSnac(response.errorMessage, context);
    }
  }

  signOut(context) async {
    final response = await MyDio.postData(
      'authlogout',
    );

    if (response.error == false) {
      sharedPref.deleteUser();
      Navigator.pushReplacementNamed(context, Login.id);
    } else if (response.error == true) {
      showSnac(response.errorMessage, context);
    }
  }

  bool checkLogin() {
    userModel = sharedPref.getUserData();
    if (userModel == null) {
      return false;
    } else {
      return true;
    }
  }
}
