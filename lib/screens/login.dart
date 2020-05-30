import 'package:echoar_unity_demo/constants.dart';

import '../navigation_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class Login extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Terrarium',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NavigationWrapper(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Constants.accentColor,
        accentColor: Constants.backgroundColor,
        errorColor: Colors.deepOrange,
        inputTheme: InputDecorationTheme(
          fillColor: Constants.accentColor,
          filled: true,
          labelStyle: TextStyle(
            color: Colors.grey,
          )
        ),
        titleStyle: TextStyle(
          color: Constants.textColor,
        ),
        textFieldStyle: TextStyle(
          color: Constants.textColor,
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Constants.textColor,
        ),
        cardTheme: CardTheme(
          color: Constants.backgroundColor,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Constants.backgroundColor,
          backgroundColor: Constants.accentColor,
          highlightColor: Constants.backgroundColor,
        ),
      ),
      messages: LoginMessages(
        signupButton: "Register",
      ),
    );
  }
}