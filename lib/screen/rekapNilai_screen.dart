import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/models/nilai.dart';
import 'package:lms/network/api_nilai.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_user.dart';

class RekapNilaiScreen extends StatefulWidget {
  const RekapNilaiScreen({super.key});

  @override
  State<RekapNilaiScreen> createState() => _RekapNilaiScreenState();
}

class _RekapNilaiScreenState extends State<RekapNilaiScreen> {
  String name = '';
  List<Nilai> _nilai = [];

  @override
  void initState() {
    _getNilai();
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userString = localStorage.getString('user');

    if (userString != null) {
      var user = jsonDecode(userString);

      if (user != null) {
        setState(() {
          name = user['nama'];
        });
      }
    }
  }

  _getNilai() {
    NilaiService.getNilai().then((nilai) {
      if (mounted) {
        setState(() {
          _nilai = nilai;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff151515),
      appBar: AppBar(
        title: const Text(
          "Rekapitulasi Nilai",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          child: const ImageIcon(AssetImage('assets/images/back.png')),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF0873A1),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  // Text(
                  //   'Hello, ',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //   ),
                  // ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "Students Data",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              nilai(),
            ],
          ),
        ),
      ),
    );
  }

  Table nilai() {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      children: [
        const TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "No.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Mata Pelajaran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Nilai",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
        for (Nilai nilai in _nilai)
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  "${nilai.kd_mapel}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  "${nilai.nilai}",
                ),
              ),
            ],
          ),
      ],
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      GoRouter.of(context).goNamed('login');
    }
  }
}
