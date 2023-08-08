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
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Text("Silahkan bayar di bank lah"),
      ),
    );
  }
}