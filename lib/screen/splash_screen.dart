// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/routes/app_routes.dart';

import '../network/api_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        // Mark the callback as async
        bool isLoggedIn =
            await checkIfUserIsLoggedIn();

        if (isLoggedIn) {
          GoRouter.of(context).goNamed(
            AppRoutes.home,
            extra: null,
          );
        } else {
          GoRouter.of(context).goNamed(
            AppRoutes.login,
            extra: null,
          );
        }
      },
    );

    super.initState();
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    var token = await Network().getToken(); // Await the Future value
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF0873A1),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logoSMK.png',
                width: size.width * 0.2,
              ),
              const SizedBox(height: 10),
              const Text(
                "Sistem Informasi Siswa",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "SMK Plus Sukaraja",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: MediaQuery.of(context).size.width/ 3.6),
                child: const LinearProgressIndicator(
                  color: Colors.white,
                  // valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Color(0xFF0873A1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
