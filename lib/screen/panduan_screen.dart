import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PanduanScreen extends StatefulWidget {
  const PanduanScreen({super.key});

  @override
  State<PanduanScreen> createState() => _PanduanScreenState();
}

class _PanduanScreenState extends State<PanduanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Panduan Pembayaran",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            children: [
              // const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Untuk pembayaran dibayar sampai tanggal 10 setiap bulannya. Pembayaran bisa dilakukan secara Tunai atau Non Tunai.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 3,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          CupertinoIcons.money_dollar_circle_fill,
                          color: Color.fromARGB(255, 39, 129, 86),
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "TUNAI / CASH",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 39, 129, 86),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Pembayaran bisa dilakukan secara tunai/cash di Kampus SMK Plus Sukaraja dengan membawa buku iuran yang telah disediakan.",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 3,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          CupertinoIcons.arrow_right_arrow_left_circle_fill,
                          color: Color.fromARGB(255, 204, 163, 41),
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "NON TUNAI / CASHLESS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 204, 163, 41),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Pembayaran bisa dilakukan secara non tunai/cashless via Bank BRI dengan ",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "No. : xxx",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Atas nama : Dina Nailul Muna",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
