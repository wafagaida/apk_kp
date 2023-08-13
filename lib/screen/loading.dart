import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/network/api_response.dart';
import 'package:lms/network/api_user.dart';
import 'package:lms/network/constants.dart';
import 'package:lms/screen/home_screen.dart';
import 'package:lms/screen/login_screen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
    String token = await getToken();
    if(token == ''){
      GoRouter.of(context).goNamed('login');
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
    }
    else {
      ApiResponse response = await getUserDetail();
      if (response.error == null){
        GoRouter.of(context).goNamed('home');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
      }
      else if (response.error == unauthorized){
        GoRouter.of(context).goNamed('login');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}