// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/network/api_user.dart';
import 'package:lms/screen/beranda_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    // required this.user,
  }) : super(key: key);

  // final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late Size size;
  // ignore: unused_field
  bool _isLoading = false;
  String nama = '';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  _loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userJson = pref.getString('user')!;
    var user = jsonDecode(userJson);

    if (user != null) {
      setState(() {
        nama = user['nama'];
      });
    }
  }

  tapBottomItem(int index) {
    if (index != 2) {
      setState(() {
        currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      scaffoldKey.currentState!.openEndDrawer(); // Un-commented this line
    }
  }

  @override
  void initState() {
    _loadUserData();
    _pageController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Apakah Anda Ingin Keluar?'),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    elevation: 2,
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Ya'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    elevation: 2,
                    backgroundColor: const Color(0xFF0873A1),
                  ),
                  child: const Text('Tidak'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: endDrawer(),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            BerandaScreen(
              // user: user,
              homeScaffold: scaffoldKey,
            ),
            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0873A1),
          unselectedItemColor: const Color.fromARGB(255, 169, 187, 196),
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: tapBottomItem,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/homeIcon.png')),
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/profileIcon.png')),
                label: "Profil"),
          ],
        ),
      ),
    );
  }

  Drawer endDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          const SizedBox(height: 8),
          _drawerMenu(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: Color(0xFF0873A1),
      ),
      margin: const EdgeInsets.only(bottom: 14),
      currentAccountPicture: const ClipOval(
        child: Image(
          image: AssetImage('assets/images/logoSMK.png'),
          height: 50,
        ),
      ),
      accountName: const Text(
        'SIRAJA',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      accountEmail: Text(
        nama,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _drawerMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     GoRouter.of(context).goNamed(AppRoutes.ubahPass);
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(12),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2),
          //           spreadRadius: 0.2,
          //           blurRadius: 1.5,
          //           offset: const Offset(0, 0),
          //         ),
          //       ],
          //     ),
          //     child: const Row(
          //       children: [
          //         Flexible(
          //           child: Row(
          //             children: [
          //               SizedBox(width: 8),
          //               Flexible(
          //                 child: Text(
          //                   "Ubah Password",
          //                   style: TextStyle(fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         ImageIcon(AssetImage('assets/images/ubahPass.png')),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              _showAboutDialog();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.2,
                    blurRadius: 1.5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        // Icon(Icons.edit_rounded),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "Tentang",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ImageIcon(AssetImage('assets/images/about.png')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              _showLogoutDialog();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.2,
                    blurRadius: 1.5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        // Icon(Icons.edit_rounded),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "Keluar",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ImageIcon(AssetImage('assets/images/logout.png')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.info_outline_rounded,
            size: 40,
          ),
          iconColor: const Color(0xFF0873A1),
          content: const Text(
              "SIRAJA merupakan Sistem Informasi Akademik Siswa SMK Plus Sukaraja berbasis Mobile Apps yang mendukung dalam mendapatkan informasi akademik yang disediakan oleh sekolah."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Kembali",
                style: TextStyle(
                  color: Color(0xFF0873A1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Yakin keluar?"),
        content: const Text("Akun anda akan keluar dari aplikasi ini"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 2,
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              logout();
              Navigator.pop(context);
            },
            child: const Text("Ya"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 2,
              backgroundColor: const Color(0xFF0873A1),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Tidak"),
          ),
        ],
      ),
    );
  }

  void logout() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var res = await Network().logout('/logout'); // Send logout request
      var body = json.decode(res.body);

      if (body["success"] == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.remove('user');
        await pref.remove('token');

        Future.delayed(
          const Duration(seconds: 1),
          () {
            Navigator.of(context).pop(true);
            GoRouter.of(context).goNamed('login');
          },
        );

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                "Berhasil Keluar",
                textAlign: TextAlign.center,
              ),
              icon: Icon(CupertinoIcons.checkmark_alt_circle),
              iconColor: Color(0xFF0873A1),
              insetPadding: EdgeInsets.symmetric(horizontal: 70),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Ada Kesalahan"),
              icon: const Icon(CupertinoIcons.checkmark_alt_circle),
              iconColor:Colors.red,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 2,
                    backgroundColor: const Color(0xFF0873A1),
                  ),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error saat logout: $error"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 2,
                  backgroundColor: const Color(0xFF0873A1),
                ),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
