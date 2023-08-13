import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/user.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token');
    // if (token != null) {
    //   if (mounted) {
    //     setState(() {
    //       isAuth = true;
    //     });
    //   }
    // }
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      // Jika user sudah login, Anda dapat mengambil data user dari sumber yang sesuai
      // Contoh: jika data user ada di SharedPreferences, Anda dapat mengambilnya di sini.
      // Tambahkan logika sesuai kebutuhan Anda untuk mengambil data pengguna.
      // Misalnya: 
      var userData = localStorage.getString('user_data');
      if (userData != null) {
        setState(() {
          loggedInUser = User.fromJson(json.decode(userData));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    // if (isAuth) {
    //   child = const HomeScreen(
    //   );
    // } else {
    //   child = const LoginScreen();
    // }
    if (loggedInUser != null) {
      child = HomeScreen(); // Kirim data user ke HomeScreen
    } else {
      child = const LoginScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}
