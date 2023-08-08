import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/screen/home_screen.dart';

class UbahPassScreen extends StatefulWidget {
  const UbahPassScreen({super.key});

  @override
  State<UbahPassScreen> createState() => _UbahPassScreenState();
}

class _UbahPassScreenState extends State<UbahPassScreen> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Password",
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
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: Colors.white,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        // borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Password Sekarang",
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 133, 141),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: Colors.white,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        // borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Password Baru",
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 133, 141),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: Colors.white,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        // borderSide: BorderSide.none,
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        "Konfirmasi Password Baru",
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 133, 141),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Simpan Perubahan?"),
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    elevation: 2,
                                    backgroundColor: const Color(0xFF0873A1),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          Future.delayed(
                                            const Duration(seconds: 2),
                                            () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           const HomeScreen()),
                                              // );
                                              Navigator.of(context).pop(true);
                                              // GoRouter.of(context).goNamed('home');
                                            },
                                          );
                                          return const AlertDialog(
                                            title: Text(
                                              "Berhasil Disimpan",
                                              textAlign: TextAlign.center,
                                            ),
                                            icon: Icon(CupertinoIcons.heart),
                                            insetPadding: EdgeInsets.symmetric(
                                                horizontal: 70),
                                          );
                                        });
                                  },
                                  child: const Text("Ya"),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          elevation: 2,
                          minimumSize: const Size(150, 45),
                          backgroundColor: const Color(0xFF0873A1),
                        ),
                        child: const Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
