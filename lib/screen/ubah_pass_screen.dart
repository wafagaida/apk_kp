import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/user.dart';
import 'package:lms/screen/home_screen.dart';
// import 'package:strapi_backend/customisation/textfield.dart';
// import 'package:strapi_backend/view/show_users.dart';
// import 'package:strapi_backend/view/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditUser extends StatefulWidget {
  final User users;
  const EditUser({super.key, required this.users});
  @override
  // ignore: library_private_types_in_public_api
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  void editUser({
    required User users,
    required String password,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userJson = pref.getString('user')!;
    var user = jsonDecode(userJson);

    final response = await http.put(
        Uri.parse(
          "http://127.0.0.1:8000/api/posts/${users.nis}",
        ),
        headers: <String, String>{
          'Context-Type': 'application/json;charset=UTF-8',
          'Authorization': 'Bearer $user',
        },
        body: <String, String>{
          'password': password,
        });
    if (response.statusCode == 200) {
      print(response.reasonPhrase);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =
        TextEditingController(text: widget.users.password);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        elevation: 0.0,
        title: const Text('Edit User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
          child: Container(
            height: 550,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.indigo[700],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      // hintText: 'Password',
                      onChanged: (val) {
                        passwordController.text = val;
                      },
                      controller: passwordController,
                    )),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        editUser(
                          users: widget.users,
                          password: passwordController.text,
                        );
                      },
                      child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
