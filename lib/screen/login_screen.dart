// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formkey;
  late TextEditingController _userController;
  late TextEditingController _passController;
  bool _isLoading = false;
  bool isVisiblePassword = false;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passController = TextEditingController();
    formkey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  SnackBar _showMsg(String message, Color color) {
    return SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'username': _userController.text,
      'password': _passController.text
    };

    var response = await Network().auth(data, '/login');
    var body = json.decode(response.body);

    if (body?["success"] == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', body['token']);
      prefs.setString('user', json.encode(body['user']));

      if (mounted) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            Navigator.of(context).pop(true);
            GoRouter.of(context).goNamed('home');
          },
        );
      }

      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              "Berhasil Masuk",
              textAlign: TextAlign.center,
            ),
            icon: Icon(CupertinoIcons.checkmark_alt_circle),
            iconColor: Color(0xFF0873A1),
            insetPadding: EdgeInsets.symmetric(horizontal: 70),
          );
        },
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(_showMsg(
          "Username atau Password Salah!",
          Colors.red,
        ));
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0873A1),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logoSMK.png",
              width: 90,
              // height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "SISTEM INFORMASI AKADEMIK",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "SMK PLUS SUKARAJA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.all(35),
              color: Colors.white,
              elevation: 10,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 6),
                        child: AutofillGroup(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 6),
                                child: TextFormField(
                                  // autofocus: true,
                                  controller: _userController,
                                  autofillHints: const [AutofillHints.username],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 227, 231, 234),
                                    isDense: true,
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    label: const Text(
                                      "Username",
                                      style: TextStyle(
                                        color: Color(0xFF146C94),
                                      ),
                                    ),
                                    // hintText: "Masukkan Username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Username Wajib Diisi';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 10),
                                child: TextFormField(
                                  controller: _passController,
                                  obscureText: !isVisiblePassword,
                                  autofillHints: const [AutofillHints.password],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 227, 231, 234),
                                    isDense: true,
                                    label: const Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Color(0xFF146C94),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            isVisiblePassword =
                                                !isVisiblePassword;
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        isVisiblePassword == false
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password Wajib Diisi";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 10),
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      minimumSize: const Size(500, 50),
                                      elevation: 4,
                                      backgroundColor: const Color(0xFF0873A1),
                                    ),
                                    onPressed: () {
                                      if (formkey.currentState?.validate() ??
                                          false) {
                                        TextInput.finishAutofillContext();
                                        login();
                                      }
                                    },
                                    child: _isLoading
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child:
                                                LoadingAnimationWidget.waveDots(
                                                    size: 30,
                                                    color: Colors.white),
                                          )
                                        : const Text(
                                            'Masuk',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//   saveSession(String username) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString("username", username);
//     await pref.setBool("login", true);
//   }
}

//   saveSession(String username) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     await pref.setString("username", username);
//     await pref.setBool("login", true);
//   }
