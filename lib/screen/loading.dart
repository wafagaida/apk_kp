import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/network/api_response.dart';
import 'package:lms/network/api_user.dart';
import 'package:lms/network/constants.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void _loadUserInfo() async {
    String token = await getToken();
    if(token == ''){
      // ignore: use_build_context_synchronously
      GoRouter.of(context).goNamed('login');
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
    }
    else {
      ApiResponse response = await getUserDetail();
      if (response.error == null){
        // ignore: use_build_context_synchronously
        GoRouter.of(context).goNamed('home');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const HomeScreen()), (route) => false);
      }
      else if (response.error == unauthorized){
        // ignore: use_build_context_synchronously
        GoRouter.of(context).goNamed('login');
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
      }
      else {
        // ignore: use_build_context_synchronously
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
      child: const Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}