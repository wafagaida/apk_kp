import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/models/news.dart';
import 'package:lms/network/constants.dart';
import 'package:lms/routes/app_routes.dart';
import 'package:lms/screen/beranda_screen_widget.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'home_fragment_widgets.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({
    super.key,
    required this.homeScaffold,
  });
  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  late Size size;
  late GlobalKey<ScaffoldState> homeScaffold;
  String nama = '';

  @override
  void initState() {
    super.initState();
    homeScaffold = widget.homeScaffold;
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userJson = pref.getString('user')!;
    var user = jsonDecode(userJson);

    if (user != null) {
      setState(() {
        nama = user['nama'];
      });
    }
  }

  //  get data pengumuman
  Future<List<News>> fetchData() async {
    var url = Uri.parse(newsUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((data) => News.fromJson(data)).toList();
    } else {
      throw Exception('Gagal Menampilkan Daftar Pengumuman');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 120,
                color: const Color(0xFF0873A1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 45, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Halo,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.waving_hand_rounded,
                              color: Colors.yellowAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        homeScaffold.currentState!.openEndDrawer();
                      },
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/logoSMK.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: Text(
                        "Pengumuman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: FutureBuilder<List<News>>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF0873A1)),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Terjadi kesalahan: ${snapshot.error}');
                            } else {
                              final List<News> newsList = snapshot.data ?? [];

                              if (newsList.isEmpty) {
                                return const Text(
                                    'Tidak ada pengumuman yang tersedia saat ini.');
                              }

                              return Column(
                                children: newsList.map((news) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: size.width * 0.25,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                          child: AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '$fotoUrl/${news.image}',
                                              placeholder: (context, url) =>
                                                  LoadingAnimationWidget.flickr(
                                                      size: 30,
                                                      leftDotColor: const Color(
                                                          0xFF0873A1),
                                                      rightDotColor:
                                                          Colors.amber),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        news.title ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        news.content ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          GoRouter.of(context).goNamed(
                                            AppRoutes.news,
                                            pathParameters: {
                                              'id': news.id.toString(),
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.open_in_new),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
