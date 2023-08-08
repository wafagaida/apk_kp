import 'package:flutter/material.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  @override
  Widget build(BuildContext context) {
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
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Senin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  color: Color(0xffE4B875),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olahraga",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/images/jam.png')),
                            SizedBox(width: 8),
                            Text("Jam 08.00-15.00"),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/images/tempat.png')),
                            SizedBox(width: 8),
                            Text("Lapangan"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Selasa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Rabu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Kamis",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "Jum'at",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
