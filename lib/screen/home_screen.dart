import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:lms/models/user.dart';
// import 'package:lms/routes/app_routes.dart';
import 'package:lms/screen/beranda_screen.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:lms/screen/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    // required this.user,
  });
  // final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Size size;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  late User user;

  tapBottomItem(int index) {
    if (index != 2) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  getUserDetail() {
    user = User.dummy();
  }

  @override
  void initState() {
    getUserDetail();
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
              user: user,
              homeScaffold: scaffoldKey,
            ),
            ProfileScreen(
              user: user,
            ),
            const SettingScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0873A1),
          unselectedItemColor: const Color.fromARGB(255, 169, 187, 196),
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: tapBottomItem,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/homeIcon.png')),
                // activeIcon: ImageIcon(AssetImage('assets/images/iconHome.png')),
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/profileIcon.png')),
                // activeIcon: ImageIcon(AssetImage('assets/images/profile1.png')),
                label: "Profil"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/settingIcon.png')),
                label: "Pengaturan"),
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
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFF0873A1),
      ),
      margin: EdgeInsets.only(bottom: 14),
      currentAccountPicture: ClipOval(
        child: Image(
          image: AssetImage('assets/images/logoSMK.png'),
          height: 50,
        ),
      ),
      accountName: Text(
        'SMK PLUS SUKARAJA',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      accountEmail: Text(
        // user.nama,
        // "${user.nama}",
        '( Wafa Ghaida Aulia )',
        style: TextStyle(
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
          GestureDetector(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.jadwal,
                // extra: User.dummy(),
              );
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
                            "Edit Password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ImageIcon(AssetImage('assets/images/ubahPass.png')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // GoRouter.of(context).goNamed(
              //   AppRoutes.jadwal,
              // extra: User.dummy(),
              // );
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
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Anda yakin keluar?"),
                  content:
                      const Text("Akun anda akan keluar dari aplikasi ini"),
                  actions: [
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        elevation: 2,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 1), () {
                          // Navigator.pop(context);
                          logOut();
                          context.goNamed('login');
                        });
                      },
                      child: const Text("Ya"),
                    ),
                  ],
                ),
              );
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

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences?.clear() ;
    setState(() {
      preferences.remove("login");
      preferences.remove("email");
    });

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }
}
