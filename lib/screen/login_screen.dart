import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../network/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _userController;
  late TextEditingController _passController;

  bool _isLoading = false;
  bool isVisiblePassword = false;

  @override
  void initState() {
    _userController = TextEditingController();
    _passController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0873A1),
      resizeToAvoidBottomInset: false,
      body: Column(
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
            "SISTEM INFORMASI SISWA",
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
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            child: TextFormField(
                              // autofocus: true,
                              controller: _userController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 227, 231, 234),
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
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 227, 231, 234),
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
                                    setState(() {
                                      isVisiblePassword = !isVisiblePassword;
                                    });
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
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size(500, 50),
                                  elevation: 4,
                                  backgroundColor: const Color(0xFF0873A1),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    login();
                                  }
                                },
                                child: _isLoading
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: LoadingAnimationWidget.waveDots(
                                            size: 30, color: Colors.white),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  SnackBar _showMsg(String message, Color color) {
    return SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    );
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': _userController.text,
      'password': _passController.text
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);

    if (body["message"] == "success") {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', json.encode(body['token']));
      // localStorage.setString('user', json.encode(body['user']));
      if (!mounted) return;
      GoRouter.of(context).goNamed('home');
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          _showMsg("Username atau Password Salah", Colors.red));
    }

    setState(() {
      _isLoading = false;
    });
  }
}

 // void login(String username, password) async {
  //   try {
  //     Response response = await post(Uri.parse('https://reqres.in/api/login'),
  //         body: {'email': 'eve.holt@reqres.in', 'password': 'cityslicka'});

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Login successfully');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future login() async {
  //   var body = {
  //     "username": _userController.text,
  //     "password": _passController.text,
  //   };
  //   final data = await http.post(
  //       Uri.parse("https://glass-faced-doubt.000webhostapp.com/api.php"),
  //       body: body);
  //   var dataUser = json.decode(data.body);

  //   if (dataUser.length == 0) {
  //     AlertDialog(
  //       title: const Text('Pesan'),
  //       content: const Text('Gagal Login'),
  //       actions: <Widget>[
  //         ElevatedButton(
  //           child: const Icon(Icons.check),
  //           // color: Colors.blue,
  //           // textColor: Colors.white,
  //           onPressed: () => Navigator.of(context).pop(),
  //         )
  //       ],
  //     );
  //   } else {
  //     if (dataUser[0]["bagian"] == 'mahasiswa') {
  //       // ignore: use_build_context_synchronously
  //       Navigator.of(context).pushNamedAndRemoveUntil(
  //           '/mahasiswa', (Route<dynamic> route) => false);
  //     }
  //   }
  // }
///////////////////////////////////////////////////////////
