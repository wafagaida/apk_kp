// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/models/bayar.dart'; // Import your model
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BayarScreen extends StatefulWidget {
  const BayarScreen({super.key});

  @override
  State<BayarScreen> createState() => _BayarScreenState();
}

class _BayarScreenState extends State<BayarScreen> {
  String? userNis;
  List<Bayar> bayarList = [];
  bool isLoading = true;
  // final bool _isExpanded = false;
  final List<ExpansionTile> _expansionTileItems = [];
  List<String> semesterList = [];
  String? selectedSemester;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  String formatNumber(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var userData = jsonDecode(user!);
    userNis = userData['nis'].toString();

    fetchData(userNis!);
  }

  Future<void> fetchData(String userNis) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = pref.getString('user');
    var url = Uri.parse('$bayarUrl/$userNis');

    try {
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

        semesterList =
            bayarList.map((bayar) => bayar.semester ?? '').toSet().toList();

        _initializeExpansionTileItems();
      } else {
        throw Exception('Gagal Menampilkan Pembayaran');
      }
    } catch (e) {
      const Center(child: Text('Tidak Ada Koneksi Internet'));
    }
  }

  void _initializeExpansionTileItems() {
    _expansionTileItems.clear();

    if (selectedSemester != null) {
      final filteredTransactions =
          _filterTransactionsBySemester(selectedSemester!);

      final tableBody = DataTable(
        columnSpacing: 25,
        dataRowHeight: 30,
        headingRowHeight: 35,
        headingTextStyle: const TextStyle(
          color: Color(0xFF0873A1),
          fontWeight: FontWeight.bold,
          fontFamily: 'Dosis',
          fontSize: 16,
        ),
        columns: const [
          DataColumn(label: Text('No.')),
          DataColumn(label: Text('Keterangan')),
          DataColumn(label: Text('Nominal')),
        ],
        rows: filteredTransactions.asMap().entries.map<DataRow>((entry) {
          final index = entry.key;
          final bayar = entry.value;
          final tunggakan = bayar.nominal! - (bayar.jumlahBayar ?? 0);

          return DataRow(cells: [
            DataCell(Text('${index + 1}.')),
            DataCell(Row(
              children: [
                Text(bayar.namaBayar ?? ''),
                const SizedBox(width: 5),
                Text("(${_formatMonth(bayar.bulan)})"),
              ],
            )),
            DataCell(Text(
              'Rp. ${formatNumber(tunggakan)}',
            )),
          ]);
        }).toList(),
        showBottomBorder: true,
      );

      _expansionTileItems.add(
        ExpansionTile(
          title: Text(
            'Lihat Rincian Tunggakan Semester $selectedSemester',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black45,
            ),
            textAlign: TextAlign.right,
          ),
          iconColor: Colors.black45,
          collapsedIconColor: Colors.black45,
          initiallyExpanded: false,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: tableBody,
            ),
          ],
        ),
      );
    }
  }

  List<Bayar> _filterTransactionsBySemester(String? semester) {
    if (semester == null) {
      return bayarList;
    } else {
      return bayarList.where((bayar) => bayar.semester == semester).toList();
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr == '-' || dateStr.isEmpty) {
      return '';
    }

    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('dd-MM-yyyy');
    final date = inputFormat.parse(dateStr);
    return outputFormat.format(date);
  }

  String _formatMonth(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return '';
    }

    final inputFormat = DateFormat('yyyy-MM');
    final outputFormat = DateFormat('MMMM yyyy');
    final date = inputFormat.parse(dateStr);
    return outputFormat.format(date);
  }

  double calculateOutstandingBalance(String? semester) {
    final filteredTransactions = _filterTransactionsBySemester(semester);
    double totalDue = 0;
    double totalPaid = 0;

    for (var transaction in filteredTransactions) {
      totalDue += transaction.nominal ?? 0;
      totalPaid += transaction.jumlahBayar ?? 0;
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Pilih Semester:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        menuMaxHeight: 250,
                        borderRadius: BorderRadius.circular(15),
                        iconEnabledColor: Colors.black,
                        hint: const Text('Semester'),
                        value: selectedSemester,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSemester = newValue;
                            _initializeExpansionTileItems(); // Call this method to update ExpansionTiles
                          });
                        },
                        items: semesterList
                            .map<DropdownMenuItem<String>>((String semester) {
                          return DropdownMenuItem<String>(
                            value: semester,
                            child: Text("Semester $semester"),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                // Display outstanding balance
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 2,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 12),
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
                        'Rp. ${formatNumber(calculateOutstandingBalance(selectedSemester).toInt())}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ..._expansionTileItems,
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Riwayat Transaksi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Display transaction history
                isLoading // Tampilkan CircularProgressIndicator jika isLoading = true
                    ? const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF0873A1))),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            for (var bayar in _filterTransactionsBySemester(
                                selectedSemester))
                              if (bayarList.isEmpty)
                                const Center(
                                  child: Text(
                                    "Belum ada data riwayat pembayaran",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              else if (bayar.jumlahBayar != null &&
                                  (selectedSemester == null ||
                                      bayar.semester == selectedSemester))
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/images/icis.png')),
                                        const SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bayar.namaBayar ??
                                                  '', //nama_bayar
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                                "(${_formatMonth(bayar.bulan)})"),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                'Rp. ${formatNumber(bayar.jumlahBayar ?? 0)}', //jumlah_bayar
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(_formatDate(
                                                bayar.tglBayar ?? '-')),
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
