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
  final List<ExpansionPanelItem> _expansionPanelItems = [];
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

      // Extract semester data from bayarList and populate semesterList
      semesterList =
          bayarList.map((bayar) => bayar.semester ?? '').toSet().toList();

      _initializeExpansionPanelItems();
    } else {
      throw Exception('Gagal Menampilkan Pembayaran');
    }
  }

  void _initializeExpansionPanelItems() {
    _expansionPanelItems.clear(); // Clear existing items

    for (String semester in semesterList) {
      final filteredTransactions = _filterTransactionsBySemester(semester);

      final tableBody = DataTable(
        columnSpacing: 20,
        dataRowHeight: 30,
        border: const TableBorder(
          bottom: BorderSide(color: Color(0xFF0873A1), width: 1),
          horizontalInside: BorderSide(color: Color(0xFF0873A1), width: 1),
        ),
        columns: const [
          DataColumn(label: Text('No.')),
          DataColumn(label: Text('Keterangan')),
          DataColumn(label: Text('Nominal')),
        ],
        rows: filteredTransactions.map<DataRow>((bayar) {
          final index = filteredTransactions.indexOf(bayar);

          return DataRow(cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Row(
              children: [
                Text(bayar.namaBayar ?? ''),
                const SizedBox(width: 5),
                Text("(${bayar.bulan})"),
              ],
            )),
            DataCell(Text(
              'Rp. ${formatNumber(bayar.nominal ?? 0)}',
            )),
          ]);
        }).toList(),
        showBottomBorder: true,
      );

      final isExpanded = selectedSemester == semester;

      _expansionPanelItems.add(
        ExpansionPanelItem(
          headerText: 'Lihat Detail Pembayaran Semester $semester',
          body: Column(
            children: [
              Container(
                child: tableBody,
              ),
            ],
          ),
          isExpanded: isExpanded,
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilih Semester:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          menuMaxHeight: 250,
                          borderRadius: BorderRadius.circular(15),
                          iconEnabledColor: Colors.black,
                          hint: const Text('Semester'),
                          value: selectedSemester,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSemester = newValue;
                              for (var item in _expansionPanelItems) {
                                item.isExpanded =
                                    item.headerText.contains(selectedSemester!);
                              }
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
                        'Rp. ${formatNumber(calculateOutstandingBalance(selectedSemester) as int)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ExpansionPanelList(
                        elevation: 1,
                        // expandedHeaderPadding: const EdgeInsets.all(0),
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _expansionPanelItems[index].isExpanded =
                                !isExpanded;
                          });
                        },
                        children: _expansionPanelItems
                            .map<ExpansionPanel>((ExpansionPanelItem item) {
                          return ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(item.headerText),
                              );
                            },
                            body: SingleChildScrollView(
                              // Wrap the DataTable in SingleChildScrollView
                              scrollDirection: Axis.horizontal,
                              child: item.body,
                            ),
                            isExpanded: item.isExpanded,
                          );
                        }).toList(),
                      ),
                      // const SizedBox(height: 20),
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF0873A1))),
                      )
                    : Column(
                        children: [
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
                          else
                            for (var bayar in _filterTransactionsBySemester(
                                selectedSemester))
                              if (bayar.jumlahBayar != null &&
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
                                        Row(
                                          children: [
                                            Text(
                                              bayar.namaBayar ??
                                                  '', //nama_bayar
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
                                                'Rp. ${formatNumber(bayar.jumlahBayar ?? 0)}', //jumlah_bayar
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(bayar.tglBayar ??
                                                ''), //tgl_bayar
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
      ),
    );
  }
}

class ExpansionPanelItem {
  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    this.isExpanded = false,
  });

  final String headerText;
  final Widget body;
  bool isExpanded;
}
