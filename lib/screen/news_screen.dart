// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../models/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<News> fetchNews() async {
    var url = Uri.parse('$newsUrl/${widget.id}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse =
          jsonDecode(response.body)['data'];
      return News.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load News');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengumuman",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          child: const ImageIcon(AssetImage('assets/images/back.png')),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF0873A1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<News>(
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF0873A1))));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Tidak Ada Koneksi Internet'));
            } else if (snapshot.hasData) {
              final News news = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: '$fotoUrl/${news.image}',
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.flickr(
                              size: 40,
                              leftDotColor: const Color(0xFF0873A1),
                              rightDotColor: Colors.amber),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            news.content ?? '',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text("Tidak ada pengumuman.");
            }
          },
        ),
      ),
    );
  }
}
