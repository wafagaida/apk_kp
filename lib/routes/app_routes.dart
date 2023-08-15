import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/screen/bayar_screen.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/jadwal_screen.dart';
import 'package:lms/screen/loading.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:lms/screen/news_screen.dart';
import 'package:lms/screen/panduan_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:lms/screen/rekapNilai_screen.dart';
import 'package:lms/screen/ubahpass_screen.dart';

import '../models/news.dart';

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
  static const String rekap = "rekap";

  static Page _loginScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: LoginScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    // late User user;
    // if (state.extra != null && state.extra is User) {
    //   user = state.extra as User;
    // } else {
    //   user = User.dummy();
    // }
    return const MaterialPage(
      child: HomeScreen(),
    );
  }

  static Page _loadingBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: Loading(),
    );
  }

  static Page _profileScreenBuilder(BuildContext context, GoRouterState state) {
    // late User user;
    // if (state.extra != null && state.extra is User) {
    //   user = state.extra as User;
    // } else {
    //   // user = User.dummy();
    // }
    return const MaterialPage(
      child: ProfileScreen(),
    );
  }

  static Page _jadwalScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: JadwalScreen(),
    );
  }

  static Page _bayarScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: BayarScreen(),
    );
  }

  static Page _rekapNilaiScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: RekapNilaiScreen(),
    );
  }

  static Page _newsScreenBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage(
      child: NewsScreen(
        news: state.extra! as News,
        id: state.extra! as News,
      ),
    );
  }

  static Page _ubahPassScreenBuilder(
      BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: UbahPassScreen(),
    );
  }

  static Page _panduanScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: PanduanScreen(),
    );
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
            name: news,
            path: "news:id",
            pageBuilder: _newsScreenBuilder,
          ),
        ],
      ),
    ],
  );
}
