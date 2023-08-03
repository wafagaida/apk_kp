import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:lms/models/user.dart';
// import 'package:lms/routes/app_routes.dart';
import 'package:lms/screen/beranda_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:lms/screen/setting_screen.dart';

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
  late Image image;
  late Title title;

  tapBottomItem(int index) {
    if (index != 3) {
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
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Ya'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
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
        // endDrawer: endDrawer(),
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
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/profileIcon.png')),
                label: "Profil"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/settingIcon.png')),
                label: "Pengaturan"),
          ],
        ),
      ),
    );
  }

  // Drawer endDrawer() {
  //   return Drawer(
  //     child: Column(children: [
  //       Container(
  //         color: Colors.blue,
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: MediaQuery.of(context).padding.top,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 32),
  //               child: AspectRatio(
  //                 aspectRatio: 1 / 1,
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(500),
  //                   // child: Image.network(
  //                   //   // user.profilePhoto!,
  //                   //   // fit: BoxFit.cover,
  //                   // ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 16,
  //             ),
  //             Text.rich(
  //               TextSpan(
  //                 text: "${user.nama} ",
  //                 style: const TextStyle(
  //                   fontSize: 16,
  //                 ),
  //                 children: [
  //                   TextSpan(
  //                     text: "(${user.username})",
  //                     style: const TextStyle(
  //                       fontStyle: FontStyle.italic,
  //                       fontSize: 14,
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             // Text(
  //             //   user.email,
  //             //   style: const TextStyle(
  //             //     color: Colors.white,
  //             //   ),
  //             // ),
  //             const SizedBox(
  //               height: 16,
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 8,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         child: GestureDetector(
  //           onTap: () {
  //             GoRouter.of(context).goNamed(
  //               AppRoutes.profile,
  //               extra: User.dummy(),
  //             );
  //           },
  //           child: Container(
  //             padding: const EdgeInsets.all(8),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               color: Colors.blue[100],
  //             ),
  //             child: const Row(
  //               children: [
  //                 Flexible(
  //                   child: Row(
  //                     children: [
  //                       Icon(
  //                         Icons.edit_rounded,
  //                       ),
  //                       SizedBox(
  //                         width: 8,
  //                       ),
  //                       Flexible(
  //                         child: Text(
  //                           "Edit Profile",
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Icon(
  //                   Icons.chevron_right_rounded,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       const Expanded(
  //         child: SizedBox(),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.symmetric(horizontal: 16),
  //         padding: const EdgeInsets.all(8),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8),
  //           color: Colors.blue,
  //         ),
  //         child: const Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(
  //               Icons.logout_rounded,
  //               color: Colors.white,
  //             ),
  //             SizedBox(
  //               width: 8,
  //             ),
  //             Text(
  //               "Logout",
  //               style: TextStyle(
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 16,
  //       ),
  //     ]),
  //   );
  // }
}
