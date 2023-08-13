import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/models/user.dart';
import 'package:lms/network/api_post.dart';
import 'package:lms/network/constants.dart';
import 'package:lms/screen/beranda_screen_widget.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:http/http.dart' as http;

import '../network/api_response.dart';
import '../network/api_user.dart';

// import 'home_fragment_widgets.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({
    super.key,
    // required this.user,
    required this.homeScaffold,
  });
  // final User user;
  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  late Size size;
  List<dynamic> _postList = [];
  int userId = 0;
  bool _loading = true;

  // // get all posts
  // Future<void> retrievePosts() async {
  //   userId = await getUserId();
  //   ApiResponse response = await getPosts();

  //   if (response.error == null) {
  //     setState(() {
  //       _postList = response.data as List<dynamic>;
  //       _loading = _loading ? !_loading : _loading;
  //     });
  //   } else if (response.error == unauthorized) {
  //     logout().then((value) => {
  //          GoRouter.of(context).goNamed('login')
  //         });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('${response.error}'),
  //     ));
  //   }
  // }

  // User? dataFromAPI;
  // _getData() async {
  //   userId = await getUserId();
  //   ApiResponse response = await getPosts();

  //   try {
  //     String url = "http://127.0.0.1:8000/api/posts";
  //     http.Response res = await http.get(Uri.parse(url));
  //     if (res.statusCode == 200) {
  //       dataFromAPI = User.fromJson(json.decode(res.body));
  //       _loading = false;
  //       setState(() {});
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('${response.error}'),
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  void initState() {
    // _getData();
    // retrievePosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            BerandaWidget.header(
              // user: widget.user,
              homeScaffoldState: widget.homeScaffold,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: BerandaWidget.cardMenu(),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: BerandaWidget.sectionTitle(
                        "Pengumuman",
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 35),
                    //   child: BerandaWidget.pengumumanCard(
                    //     size,
                    //     "https://picsum.photos/1080/690",
                    //     "PPDB",
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: BerandaWidget.pengumumanNews(
                        size,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
