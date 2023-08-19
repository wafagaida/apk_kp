import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/screen/about_screen.dart';
import 'package:lms/screen/bayar_screen.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/jadwal_screen.dart';
import 'package:lms/screen/loading.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:lms/screen/news_screen.dart';
import 'package:lms/screen/panduan_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:lms/screen/rekapNilai_screen.dart';
import 'package:lms/screen/smtNilai_screen.dart';
import 'package:lms/screen/ubahpass_screen.dart';

class AppRoutes {
  static const String loading = "loading";
  static const String login = "login";
  static const String home = "home";
  static const String profile = "profile";
  static const String jadwal = "jadwal";
  static const String bayar = "bayar";
  static const String news = "news";
  static const String ubahPass = "ubahPass";
  static const String panduan = "panduan";
  static const String tentang = "tentang";
  static const String rekap = "rekap";
  static const String smtNilai = "smtNilai";

  static Page _loginScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: LoginScreen());
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: HomeScreen());
  }

  static Page _loadingBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: Loading());
  }

  static Page _profileScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: ProfileScreen());
  }

  static Page _jadwalScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: JadwalScreen());
  }

  static Page _bayarScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: BayarScreen(),
    );
  }

  static Page _rekapNilaiScreenBuilder(
      BuildContext context, GoRouterState state) {
    return const MaterialPage(child: RekapNilaiScreen());
  }

  static Page _smtNilaiScreenBuilder(
      BuildContext context, GoRouterState state) {
    return const MaterialPage(child: SmtNilaiScreen());
  }

  static Page _newsScreenBuilder(BuildContext context, GoRouterState state) {
    String id = state.pathParameters['id'] ?? '0';
    return MaterialPage(
      child: NewsScreen(id: int.parse(id)),
    );
  }

  static Page _ubahPassScreenBuilder(
      BuildContext context, GoRouterState state) {
    // var users;
    return const MaterialPage(
      child: UbahPassScreen(),
      // child: EditUser(users: users),
    );
  }
  // static Page _ubahPassScreenBuilder(
  //     BuildContext context, GoRouterState state) {
  //   var users = state.extra  as User; // Mendapatkan data pengguna dari state.arguments

  //   if (users != null) {
  //     return MaterialPage(
  //       child: EditUser(users: users),
  //     );
  //   } else {
  //     // Handle the case where users is null
  //     return MaterialPage(
  //       child:
  //           Placeholder(), // Gantikan dengan widget atau tindakan yang sesuai
  //     );
  //   }
  // }

  static Page _panduanScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: PanduanScreen());
  }

  static Page _aboutScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: AboutScreen());
  }

  static final GoRouter goRouter = GoRouter(
    initialLocation: "/login",
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      GoRoute(
        name: loading,
        path: "/loading",
        pageBuilder: _loadingBuilder,
      ),
      GoRoute(
        name: login,
        path: "/login",
        pageBuilder: _loginScreenBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: profile,
            path: "profile",
            pageBuilder: _profileScreenBuilder,
          ),
          GoRoute(
            name: ubahPass,
            path: "ubahPass",
            pageBuilder: _ubahPassScreenBuilder,
          ),
          GoRoute(
            name: jadwal,
            path: "jadwal",
            pageBuilder: _jadwalScreenBuilder,
          ),
          GoRoute(
            name: bayar,
            path: "bayar",
            pageBuilder: _bayarScreenBuilder,
          ),
          GoRoute(
            name: panduan,
            path: "panduan",
            pageBuilder: _panduanScreenBuilder,
          ),
          GoRoute(
            name: rekap,
            path: "rekap",
            pageBuilder: _rekapNilaiScreenBuilder,
          ),
          GoRoute(
            name: smtNilai,
            path: "smtNilai",
            pageBuilder: _smtNilaiScreenBuilder,
          ),
          GoRoute(
            name: news,
            path: "$news:id",
            pageBuilder: _newsScreenBuilder,
          ),
          GoRoute(
            name: tentang,
            path: "tentang",
            pageBuilder: _aboutScreenBuilder,
          ),
        ],
      ),
    ],
  );
}
