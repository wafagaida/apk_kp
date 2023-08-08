import 'package:flutter/material.dart';

import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _nisController;
  TextEditingController? _kelasController;
  TextEditingController? _jurusanController;
  TextEditingController? _emailController;
  TextEditingController? _jkController;
  TextEditingController? _alamatController;
  // TextEditingController? _nomorTlpController;

  @override
  void initState() {
    _nisController = TextEditingController(text: widget.user.nis.toString());
    _nameController = TextEditingController(text: widget.user.nama);
    _kelasController = TextEditingController(text: widget.user.kelas);
    _jurusanController = TextEditingController(text: widget.user.jurusan);
    _emailController = TextEditingController(text: widget.user.email);
    _jkController = TextEditingController(text: widget.user.jk);
    _alamatController = TextEditingController(text: widget.user.alamat);
    super.initState();
  }

  @override
  void dispose() {
    _nisController!.dispose();
    _nameController!.dispose();
    _kelasController!.dispose();
    _jurusanController!.dispose();
    _alamatController!.dispose();
    _jkController!.dispose();
    _emailController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Profil",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0873A1),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nameController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "NIS",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _nisController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/nis.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "NIK",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _emailController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/nis.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _kelasController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Kelas",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _kelasController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Jurusan",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _jurusanController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Tempat Tanggal Lahir",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _jurusanController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Alamat",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _alamatController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _jkController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/nis.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Apalagi y",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _kelasController,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const ImageIcon(
                      AssetImage('assets/images/jurusan.png'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
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
