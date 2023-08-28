import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class BerandaWidget {
  static cardMenu() {
    return const CardMenu();
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
            Expanded(
              // flex: 1,
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).goNamed(AppRoutes.jadwal);
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
                  GoRouter.of(context).goNamed(AppRoutes.smtNilai);
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
                  GoRouter.of(context).goNamed(AppRoutes.panduan);
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
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Akademik",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      GoRouter.of(context)
                                          .goNamed(AppRoutes.jadwal);
                                    },
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.white.withOpacity(0),
                                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: const Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/jadwal.png"),
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
                                      GoRouter.of(context)
                                          .goNamed(AppRoutes.smtNilai);
                                    },
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.white.withOpacity(0),
                                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: const Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/nilaiSmt.png"),
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
                                            image: AssetImage(
                                                "assets/images/transkip.png"),
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
                            const SizedBox(height: 18),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Administrasi",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                            image: AssetImage(
                                                "assets/images/bayar.png"),
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
                                      GoRouter.of(context)
                                          .goNamed(AppRoutes.panduan);
                                    },
                                    child: Card(
                                      color: Colors.white.withOpacity(0),
                                      elevation: 0,
                                      child: const Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/panduan.png"),
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
                                const Expanded(
                                  // flex: 1,
                                  child: Card(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 60),
                          ],
                        ),
                      );
                    },
                  );
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