import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/nilai.dart';
import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RekapNilaiScreen extends StatefulWidget {
  const RekapNilaiScreen({super.key});

  @override
  State<RekapNilaiScreen> createState() => _RekapNilaiScreenState();
}

Future<List<Nilai>> fetchData(String userNis) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = pref.getString('user');
  var url = Uri.parse('$nilaiUrl/$userNis');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $user',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
    return jsonResponse.map((data) => Nilai.fromJson(data)).toList();
  } else {
    throw Exception('Gagal Menampilkan Nilai');
  }
}

class _RekapNilaiScreenState extends State<RekapNilaiScreen> {
  String? userNis;
  late Size size;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var userData = jsonDecode(user!);
    userNis = userData['nis'].toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (userNis == null) {
      return const CircularProgressIndicator(); // Menampilkan loading jika userKdKelas belum tersedia
    }
    return Scaffold(
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Nilai>>(
          future: fetchData(userNis!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Tidak Ada Koneksi Internet'));
            } else if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))),
              );
            } else {
              Map<String, List<Nilai>> nilaiBySmt = {};
              for (var nilai in snapshot.data!) {
                nilaiBySmt.putIfAbsent(nilai.semester ?? '', () => []);
                nilaiBySmt[nilai.semester]!.add(nilai);
              }
              return ListView.builder(
                itemCount: nilaiBySmt.length,
                itemBuilder: (context, index) {
                  String semester = nilaiBySmt.keys.toList()[index];
                  List<Nilai> nilaiList = nilaiBySmt[semester]!;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Semester $semester",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: DataTable(
                            // ignore: deprecated_member_use
                            dataRowHeight: 38,
                            headingRowHeight: 45,
                            columnSpacing: 25,
                            border: const TableBorder(
                              verticalInside:
                                  BorderSide(width: 1, color: Colors.black12),
                              top: BorderSide(width: 1, color: Colors.black12),
                              left: BorderSide(width: 1, color: Colors.black12),
                              right:
                                  BorderSide(width: 1, color: Colors.black12),
                            ),
                            // columnSpacing: MediaQuery.of(context).size.width / (3 + 1),
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'No',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Mata Pelajaran',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'KKM',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Nilai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                            rows: nilaiList.map((nilai) {
                              final index = nilaiList.indexOf(nilai);
                              return DataRow(cells: [
                                DataCell(Text('${index + 1}')),
                                DataCell(
                                  SizedBox(
                                    // width:
                                    //     170,
                                    child: Text(nilai.mapel?.namaMapel ?? ''),
                                  ),
                                ),
                                DataCell(Text(nilai.mapel?.kkm ?? '-')),
                                DataCell(
                                  Text(
                                    nilai.nilai ?? '-',
                                    style: TextStyle(
                                      color: (nilai.nilai != null &&
                                              double.tryParse(nilai.nilai!) !=
                                                  null &&
                                              double.tryParse(
                                                      nilai.mapel?.kkm ??
                                                          '0') !=
                                                  null &&
                                              double.parse(nilai.nilai!) <
                                                  double.parse(
                                                      nilai.mapel?.kkm ?? '0'))
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ]);
                            }).toList(),
                            showBottomBorder: true,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
