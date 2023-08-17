import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/nilai.dart';
import 'package:http/http.dart' as http;

class SmtNilaiScreen extends StatefulWidget {
  const SmtNilaiScreen({super.key});

  @override
  State<SmtNilaiScreen> createState() => _SmtNilaiScreenState();
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

class _SmtNilaiScreenState extends State<SmtNilaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff151515),
      appBar: AppBar(
        title: const Text(
          "Nilai Semester",
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
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: FutureBuilder<List<Nilai>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "X - Semester 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataTable(
                      // columnSpacing: 30,
                      // ignore: deprecated_member_use
                      dataRowHeight: 30,
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Mata Pelajaran',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Nilai',
                            style: TextStyle(
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
                                DataCell(Text(data.title)),
                                DataCell(Text(data.userId.toString())),
                              ]);
                        },
                      ).toList(),
                      showBottomBorder: true,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))));
            },
          ),
        ),
      ),
    );
  }
}
