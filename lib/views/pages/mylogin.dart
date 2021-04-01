import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bettingtips/repositories/user_repo.dart';
import 'package:bettingtips/models/records.dart';
import 'dashboard.dart';
import 'package:crypto/crypto.dart';
import 'package:password/password.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    UserRepository userrepo = new UserRepository();
    return Future.delayed(loginTime).then((_) async {
      List<Records> user = await userrepo.fetchSpecificList(data.name);
      Records myuser = user.first;
      if (user.isEmpty) {
        return 'Username no dey ';
      }
      if (!(myuser.email == data.name)) {
        return 'Username doesn\'t not exists';
      }
      var key = utf8.encode('teleprinter');
      var bytes = utf8.encode(data.password);

      var hmacSha256 = new Hmac(sha512, key); // HMAC-SHA256
      var digest = hmacSha256.convert(bytes);
      print(digest.toString().length);
      print(myuser.password.length);
      if (!(digest.toString() == myuser.password)) {
        return 'Password does not match';
      }

      return null;
    });
  }

  Future<String> _createUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    UserRepository userrepo = new UserRepository();
    var key = utf8.encode('teleprinter');
    var bytes = utf8.encode(data.password);

    var hmacSha256 = new Hmac(sha512, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    String pass = digest.toString();
    return Future.delayed(loginTime).then((_) async {
      Records myuser =
          new Records(name: "", password: pass, email: data.name, username: "");
      Records user = await userrepo.registeruser(myuser.regtoJson());
      if (user.email.isEmpty) {
        return 'Unable to register user. Try again';
      }

      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    UserRepository userrepo = new UserRepository();

    return Future.delayed(loginTime).then((_) async {
      bool result = await userrepo.resetpassword(name);
      // if (!users.containsKey(name)) {
      //   return 'Username not exists';
      // }
      if (!result) {
        return 'Could not reset password for $name';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Plastic Cycle',
      logo: 'assets/images/acelords_brand.png',
      onLogin: _authUser,
      onSignup: _createUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
