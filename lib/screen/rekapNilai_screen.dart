import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/models/nilai.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_user.dart';

class RekapNilaiScreen extends StatefulWidget {
  const RekapNilaiScreen({super.key});

  @override
  State<RekapNilaiScreen> createState() => _RekapNilaiScreenState();
}

Future<List<Nilai>> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Nilai.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _RekapNilaiScreenState extends State<RekapNilaiScreen> {
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
      body: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        elevation: 10,
        child: FutureBuilder<List<Nilai>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: DataTable(
                  // columnSpacing: 30,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'No',
                        style: TextStyle(
                          // fontSize: 18,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Mata Pelajaran',
                        style: TextStyle(
                          // fontSize: 18,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nilai',
                        style: TextStyle(
                          // fontSize: 18,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  rows: List.generate(
                    snapshot.data!.length,
                    (index) {
                      var data = snapshot.data![index];
                      return DataRow(
                          color: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return Colors.white;
                          }),
                          cells: [
                            DataCell(Text(data.id.toString())),
                            DataCell(Text(data.title)),
                            DataCell(Text(data.userId.toString())),
                          ]);
                    },
                  ).toList(),
                  showBottomBorder: true,
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))));
          },
        ),
      ),
    );
  }

  
}
