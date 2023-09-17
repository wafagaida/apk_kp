import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? data;
  bool isLoading = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtNamaController = TextEditingController();

  _loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userJson = pref.getString('user')!;

    if (userJson.isNotEmpty) {
      setState(() {
        data = User.fromJson(jsonDecode(userJson));
        isLoading = false;
      });
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return '';
    }

    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('dd MMMM yyyy');
    final date = inputFormat.parse(dateStr);
    return outputFormat.format(date);
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
          padding: EdgeInsets.symmetric(horizontal: 10),
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
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child:
            isLoading // Tampilkan CircularProgressIndicator jika isLoading = true
                ? const Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Nama Lengkap",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.nama ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/nama.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "NIS",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.nis?.toString() ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/nis.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "NIK",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.nik ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/nis.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Tingkat",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.tingkat ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/kelas.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Jurusan",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.jurusan ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/jurusan.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Jenis Kelamin",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.jenisKelamin ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/jk.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Tanggal Lahir",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(_formatDate(data?.tanggalLahir ?? '-')),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/tl.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Alamat",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.alamat ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/alamat.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "No. Telpon",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.noTlp ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/noHp.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Tahun Masuk",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              decoration: InputDecoration(
                                isDense: true,
                                label: Text(data?.tahunMasuk ?? '-'),
                                prefixIcon: const ImageIcon(
                                  AssetImage('assets/images/jurusan.png'),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
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
