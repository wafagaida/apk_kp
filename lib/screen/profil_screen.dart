import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // User? user
  String nama = '';
  String nis = '';
  String nik = '';
  String kelas = '';
  String jurusan = '';
  String jenisKelamin = '';
  String tanggalLahir = '';
  String tahunMasuk = '';
  String noTlp = '';
  String alamat = '';
  bool loading = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtNamaController = TextEditingController();

  _loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // var user = jsonDecode(localStorage.getString('user'));
    var userJson = pref.getString('user')!;
    var user = jsonDecode(userJson);

    if (user != null) {
      setState(() {
        nama = user['nama'];
        nis = user['nis'];
        nik = user['nik'];
        kelas = user['kelas'];
        jurusan = user['jurusan'];
        jenisKelamin = user['jenis_kelamin'];
        tanggalLahir = user['tanggal_lahir'];
        tahunMasuk = user['tahun_masuk'];
        noTlp = user['no_tlp'];
        alamat = user['alamat'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Nama Lengkap",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(nama),
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
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(nis),
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
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(nik),
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
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(kelas),
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
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(jurusan),
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
                  "Jenis Kelamin",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(jenisKelamin),
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
                  "Tanggal Lahir",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(tanggalLahir),
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
                  "Alamat",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(alamat),
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
                  "No. Telpon",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(noTlp),
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
                  "Tahun Masuk",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: Text(tahunMasuk),
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
