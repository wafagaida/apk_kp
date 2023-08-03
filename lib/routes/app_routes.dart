import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:lms/screen/profil_screen.dart';
import 'package:lms/screen/setting_screen.dart';

import '../models/user.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String login = "login";
  static const String home = "home";
  static const String setting = "setting";
  static const String profile = "profile";

  static Page _loginScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: LoginScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen(),
    );
  }

  // static Page _splashScreenBuilder(BuildContext context, GoRouterState state) {
  //   return const MaterialPage(
  //     child: SplashScreen(),
  //   );
  // }

  static Page _profileScreenBuilder(BuildContext context, GoRouterState state) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User.dummy();
    }
    return MaterialPage(
      child: ProfileScreen(
          user: user,
          ),
    );
  }

  static Page _settingScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: SettingScreen(
          // news: state.extra! as News,
          ),
    );
  }

  static final GoRouter goRouter = GoRouter(
    initialLocation: "/login",
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      // GoRoute(
      //   name: splash,
      //   path: "/splash",
      //   pageBuilder: _splashScreenBuilder,
      // ),
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
            name: setting,
            path: "setting",
            pageBuilder: _settingScreenBuilder,
          ),
        ],
      ),
    ],
  );
}
