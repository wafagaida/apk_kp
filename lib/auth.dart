import 'package:flutter/material.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget{
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth>{
  bool isAuth = false;

  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    Widget child;
    if(isAuth){
      child = const HomeScreen();
    } else{
      child = const LoginScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}