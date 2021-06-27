import 'package:singlepay/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setInt("userId", user.userId);
    prefs.setString("username", user.username);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
    prefs.setString("phone", user.full_name);
    prefs.setString("type", user.type);
    prefs.setString("token", user.token);
    prefs.setString("renewalToken", user.renewalToken);

    print("object prefere");
    print(user.renewalToken);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //int userId = prefs.getInt("userId");
    String username = prefs.getString("username");
    String email = prefs.getString("email");
    String full_name = prefs.getString("full_name");
    String phone = prefs.getString("phone");
    String type = prefs.getString("type");
    String token = prefs.getString("token");
    String renewalToken = prefs.getString("renewalToken");

    return User(
        //userId: userId,
        username: username,
        email: email,
        full_name: full_name,
        phone: phone,
        type: type,
        token: token,
        renewalToken: renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("username");
    prefs.remove("email");
    prefs.remove("full_name");
    prefs.remove("phone");    
    prefs.remove("type");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}