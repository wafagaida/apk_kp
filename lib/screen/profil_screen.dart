import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/network/api_response.dart';
import 'package:lms/network/api_user.dart';
import 'package:lms/network/user_api.dart';
import 'package:lms/screen/login_screen.dart';

import '../models/user.dart';
import '../network/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    // required this.user,
  });
  // final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  bool loading = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtNamaController = TextEditingController();

  // get user detail
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if(response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        txtNamaController.text = user!.nama ?? '';
      });
    }
    else if(response.error == unauthorized){
      logout().then((value) => {
        GoRouter.of(context).goNamed('login')
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false)
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}')
      ));
    }
  }


  @override
  void initState() {
    super.initState();
    getUser();
    // _getData();
  }

  // Future<void> _getUsers() async {
  //   try {
  //     final response = await _network
  //         .getData(ApiConstants.users); // Memanggil API menggunakan Network
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       setState(() {
  //         _user = User.fromJson(data);
  //       });
  //     } else {
  //       print('Failed to load data');
  //     }
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

//  _getData() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var user = jsonDecode((localStorage..getString('user')) as String);

//     if(user != null) {
//       setState(() {
//         nama = user['nama'];
//       });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return loading ? Center(child: CircularProgressIndicator(),) :
       Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Profil",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF0873A1),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    "Nama Lengkap",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: txtNamaController,
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      // label: Text('${_user.nama}'),
                      prefixIcon: const ImageIcon(
                        AssetImage('assets/images/jurusan.png'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "NIS",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: txtNamaController,
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      // label: Text('${_user.nama}'),
                      prefixIcon: const ImageIcon(
                        AssetImage('assets/images/nis.png'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "NIK",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: txtNamaController,
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      // label: Text('${_user.nama}'),
                      prefixIcon: const ImageIcon(
                        AssetImage('assets/images/nis.png'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Kelas",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: txtNamaController,
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      // label: Text('${_user.nama}'),
                      prefixIcon: const ImageIcon(
                        AssetImage('assets/images/jurusan.png'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Jurusan",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                   controller: txtNamaController,
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      isDense: true,
                      // label: Text('${_user.nama}'),
                      prefixIcon: const ImageIcon(
                        AssetImage('assets/images/jurusan.png'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
