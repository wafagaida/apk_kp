import 'package:flutter/material.dart';
import 'package:lms/screen/jadwal_screen.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lms/routes/app_routes.dart';

import '../models/user.dart';

class BerandaWidget {
  static header({
    required User user,
    required GlobalKey<ScaffoldState> homeScaffoldState,
  }) {
    return HeaderWidget(
      user: user,
      homeScaffoldState: homeScaffoldState,
    );
  }

  static cardMenu() {
    return const CardMenu();
  }

  static sectionTitle(String label) {
    return SectionTitle(label: label);
  }

  static pengumumanCard(
    Size size,
    String pictureUrl,
    String newsTitle,
  ) {
    return PengumumanCard(
      size: size,
      pictureUrl: pictureUrl,
      newsTitle: newsTitle,
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
    required this.homeScaffoldState,
  });

  final User user;
  final GlobalKey<ScaffoldState> homeScaffoldState;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100,
        color: const Color(0xFF0873A1),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      // user.nama,
                      "Wafa Ghaida",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.waving_hand_rounded,
                      color: Colors.yellowAccent,
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              // onTap: () {
              //   homeScaffoldState.currentState!.openEndDrawer();
              // },
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/logoSMK.png"),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/jadwal.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Jadwal\nPelajaran",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                // splashColor: Colors.amber,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/bayar.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Pembayaran\n",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                // splashColor: Colors.amber,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/transkip.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Transkip\nNilai",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                // splashColor: Colors.amber,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logoSMK.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Nilai\n",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                // splashColor: Colors.amber,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logoSMK.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Panduan\nPembayaran",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalScreen()),
                  );
                },
                // splashColor: Colors.amber,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logoSMK.png"),
                        height: 50,
                      ),
                      // Icon(Icons.home, size: 30, color: Colors.black26),
                      Text(
                        "Lainnya\n",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // color: Color(0xFF0873A1),
          ),
        ),
        const Icon(
          Icons.chevron_right_rounded,
        ),
      ],
    );
  }
}

class PengumumanCard extends StatelessWidget {
  const PengumumanCard({
    super.key,
    required this.size,
    required this.pictureUrl,
    required this.newsTitle,
  });

  final Size size;
  final String pictureUrl;
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              pictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50,
            width: size.width - 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Text(
            newsTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

// class LatestNewsSection extends StatelessWidget {
//   const LatestNewsSection({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Column(
//         children: newslist.map(
//               (e) => Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     8,
//                   ),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       spreadRadius: 1,
//                       color: Colors.black12,
//                     ),
//                   ],
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     // GoRouter.of(context).goNamed(AppRoutes.newsDetail,
//                     //     params: {
//                     //       "id": e.id.toString(),
//                     //     },
//                     //     extra: e);
//                   },
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: size.width * 0.25,
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(8),
//                             bottomLeft: Radius.circular(8),
//                           ),
//                           child: AspectRatio(
//                             aspectRatio: 1 / 1,
//                             child: Image.asset(
//                               e.gambar,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Flexible(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             e.judul,
//                             maxLines: 2,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//             .toList()
//         );
  // }
// }

// ignore: must_be_immutable
// class Menu extends StatelessWidget {
//   String image;
//   String title;

//   Menu({
//     super.key,
//     required this.title,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image(
//           height: 60,
//           width: 60,
//           image: AssetImage(image),
//         ),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 15),
//         ),
//         const SizedBox(
//           height: 18,
//         )
//       ],
//     );
//   }
// }
