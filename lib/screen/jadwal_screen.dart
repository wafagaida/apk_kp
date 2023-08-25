import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/jadwal.dart';
import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

Future<List<Jadwal>> fetchData(String userKdKelas) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = pref.getString('user');
  var url = Uri.parse('$jadwalUrl/$userKdKelas');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $user',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
    return jsonResponse.map((data) => Jadwal.fromJson(data)).toList();
  } else {
    throw Exception('Gagal Menampilkan Daftar Jadwal');
  }
}


class _JadwalScreenState extends State<JadwalScreen> {
  String? userKdKelas; 

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var userData = jsonDecode(user!);
    userKdKelas = userData['kd_kelas'];

    setState(() {}); // Memanggil setState untuk memperbarui tampilan
  }

  @override
  Widget build(BuildContext context) {
    if (userKdKelas == null) {
      return const CircularProgressIndicator(); // Menampilkan loading jika userKdKelas belum tersedia
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Jadwal Pelajaran",
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Jadwal>>(
          future: fetchData(userKdKelas!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Mengelompokkan jadwal berdasarkan hari
              Map<String, List<Jadwal>> jadwalByHari = {};
              for (var jadwal in snapshot.data!) {
                jadwalByHari.putIfAbsent(jadwal.hari ?? '', () => []);
                jadwalByHari[jadwal.hari]!.add(jadwal);
              }
              return SingleChildScrollView(
                child: Column(
                  children: jadwalByHari.entries.map((entry) {
                    String hari = entry.key;
                    List<Jadwal> jadwalList = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              hari,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Column(
                            children: jadwalList.map((jadwal) {
                              return Card(
                                color: const Color(0xffE4B875),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        jadwal.mapel?.namaMapel ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const ImageIcon(AssetImage(
                                              'assets/images/jam.png')),
                                          const SizedBox(width: 8),
                                          Text("Jam ${jadwal.jam}"),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const ImageIcon(AssetImage(
                                              'assets/images/tempat.png')),
                                          const SizedBox(width: 8),
                                          // Text("Lapangan"),
                                          Text(jadwal.mapel?.namaGuru ?? ''),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))));
          },
        ),
      ),
    );
  }
}
