import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/bayar.dart'; // Import your model
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BayarScreen extends StatefulWidget {
  const BayarScreen({super.key});

  @override
  State<BayarScreen> createState() => _BayarScreenState();
}

class _BayarScreenState extends State<BayarScreen> {
  String? userNis;
  List<Bayar> bayarList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var userData = jsonDecode(user!);
    userNis = userData['nis'];

    fetchData(userNis!); // Call fetchData here
  }

  Future<void> fetchData(String userNis) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var url = Uri.parse('$bayarUrl/$userNis');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $user',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
      setState(() {
        bayarList = jsonResponse.map((data) => Bayar.fromJson(data)).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Gagal Menampilkan Pembayaran');
    }
  }

  double calculateOutstandingBalance(List<Bayar> transactions) {
    double totalDue = 0;
    double totalPaid = 0;

    for (var transaction in transactions) {
      totalDue += transaction.nominal ?? 0; // Use 0 as default if null
      totalPaid += transaction.jumlahBayar ?? 0; // Use 0 as default if null
    }

    return totalDue - totalPaid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pembayaran",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              // Display outstanding balance
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 3,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.only(top: 5, left: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: Colors.red,
                      ),
                      child: const Text(
                        "Tunggakan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Rp. ${calculateOutstandingBalance(bayarList)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              // Display paid transactions
              // for (var bayar in bayarList)
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   elevation: 3,
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 35,
              //         width: MediaQuery.of(context).size.width * 0.5,
              //         padding: const EdgeInsets.only(top: 5, left: 12),
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(8),
              //             topRight: Radius.circular(8),
              //           ),
              //           color: Colors.blueAccent,
              //         ),
              //         child: const Text(
              //           "Lunas",
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       Text(
              //         "Rp. ${bayar.jumlahBayar}",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 15),
              const Text(
                "Riwayat Transaksi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              // Display transaction history
              isLoading // Tampilkan CircularProgressIndicator jika isLoading = true
                  ? const Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))),
                    )
                  : Column(
                      children: [
                        if (bayarList.isEmpty)
                          const Center(
                            child: Text(
                              "Tidak ada data pembayaran",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          for (var bayar in bayarList)
                            if (bayar.jumlahBayar != null)
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/icis.png')),
                                      Row(
                                        children: [
                                          Text(
                                            bayar.namaBayar ?? '', //nama_bayar
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text("(${bayar.bulan})"),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "RP. ${bayar.jumlahBayar}", //jumlah_bayar
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              bayar.tglBayar ?? ''), //tgl_bayar
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  const Divider(thickness: 1),
                                ],
                              ),
                      ],
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
