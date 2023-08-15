import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class BerandaWidget {

  static cardMenu() {
    return const CardMenu();
  }

  static sectionTitle(String label) {
    return SectionTitle(label: label);
  }

  // static pengumumanCard(
  //   Size size,
  //   String pictureUrl,
  //   String newsTitle,
  // ) {
  //   return PengumumanCard(
  //     size: size,
  //     pictureUrl: pictureUrl,
  //     newsTitle: newsTitle,
  //   );
  // }

  // static pengumumanNews(Size size) {
  //   return PengumumanNews(size: size);
  // }
}



// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({
//     super.key,
//     // required this.user,
//     required this.homeScaffoldState,
//   });

//   // final User user;
//   final GlobalKey<ScaffoldState> homeScaffoldState;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Container(
//         height: 120,
//         color: const Color(0xFF0873A1),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 35, top: 45, right: 35),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Halo,",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       // user.nama,
//                       "Wafa Ghaida Aulia",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Icon(
//                       Icons.waving_hand_rounded,
//                       color: Colors.yellowAccent,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {
//                 homeScaffoldState.currentState!.openEndDrawer();
//               },
//               child: const CircleAvatar(
//                 backgroundImage: AssetImage("assets/images/logoSMK.png"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
// }

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppRoutes.jadwal,
                    // extra: User.dummy(),
                  );
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0),
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/jadwal.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
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
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppRoutes.bayar,
                    // extra: User.dummy(),
                  );
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0),
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bayar.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
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
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppRoutes.rekap,
                  //   // extra: User.dummy(),
                  );
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0),
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/transkip.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Rekapitulasi\nNilai",
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
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  // GoRouter.of(context).goNamed(
                  //   AppRoutes.jadwal,
                  //   // extra: User.dummy(),
                  // );
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0),
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/nilaiSmt.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Nilai\nSementara",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppRoutes.panduan,
                  );
                },
                child: Card(
                  color: Colors.white.withOpacity(0),
                  elevation: 0,
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/panduan.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
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
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  // GoRouter.of(context).goNamed(
                  //   AppRoutes.bayar,
                  //   // extra: User.dummy(),
                  // );
                },
                child: Card(
                  color: Colors.white.withOpacity(0),
                  elevation: 0,
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/lainnya.png"),
                        height: 40,
                      ),
                      SizedBox(height: 5),
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
      ],
    );
  }
}

// class PengumumanNews extends StatelessWidget {
//   const PengumumanNews({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             spreadRadius: 1,
//             color: Colors.black12,
//           ),
//         ],
//       ),
//       child: FutureBuilder<List<News>>(
//         future: getNews(),  // Fetch news data from the API
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             if (snapshot.data!.isNotEmpty) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   final newsItem = snapshot.data![index];
//                   return InkWell(
//                     onTap: () {
//                       // Handle news item tap
//                     },
//                     child: ListTile(
//                       leading: Image.network(newsItem.image),
//                       title: Text(newsItem.title),
//                       subtitle: Text(newsItem.content),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(
//                 child: Text("Tidak Ada Data"),
//               );
//             }
//           } else {
//             return const Center(
//               child: Text("Error"),
//             );
//           }
//         },
//       ),
//     );
//   }
// }


// class PengumumanNews extends StatelessWidget {
//   PengumumanNews({
//     super.key,
//     required this.size,
//   });

//   final Size size;
//   final NewsController newsController = NewsController();

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             spreadRadius: 1,
//             color: Colors.black12,
//           ),
//         ],
//       ),
//       child: FutureBuilder<List<News>>(
//         future: newsController.fetchAll(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             if (snapshot.data!.isNotEmpty) {
//               inspect(snapshot.data!);
//               return InkWell(
//                 onTap: () {
//                   GoRouter.of(context).goNamed(AppRoutes.news);
//                 },
//                 child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     return Row(
//                       children: [
//                         SizedBox(
//                           width: size.width * 0.25,
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               bottomLeft: Radius.circular(8),
//                             ),
//                             child: AspectRatio(
//                               aspectRatio: 1 / 1,
//                               child: Image.network(
//                                 snapshot.data![index].image,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               snapshot.data![index].title,
//                               maxLines: 2,
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       height: size.height * 0.0005,
//                     );
//                   },
//                   itemCount: snapshot.data!.length,
//                 ),
//               );
//             } else {
//               return const Text("Tidak Ada Data");
//             }
//           } else {
//             return const Text("Error");
//           }
//         },
//       ),
//     );
//   }
// }
  

// class PengumumanCard extends StatelessWidget {
//   const PengumumanCard({
//     super.key,
//     required this.size,
//     required this.pictureUrl,
//     required this.newsTitle,
//   });

//   final Size size;
//   final String pictureUrl;
//   final String newsTitle;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(
//             10,
//           ),
//           child: AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Image.network(
//               pictureUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           child: Container(
//             height: 50,
//             width: size.width - 32,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.5),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 16,
//           left: 16,
//           child: Text(
//             newsTitle,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
