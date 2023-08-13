// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lms/network/api_news.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/news.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({
    super.key,
    required this.news,
  });
  News news;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // String nama = '';
  List<News> _news = [];

  @override
  void initState() {
    super.initState();
    // _loadUserData();
    _getStudent();
  }

  // _loadUserData() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var user = json.decode(localStorage.getString('user'));

  //   if (user != null) {
  //     setState(() {
  //       nama = user['nama'];
  //     });
  //   }
  // }

  _getStudent() {
    getNews().then((news) {
      if (mounted) {
        setState(() {
          _news = news as List<News>;
        });
      }
    });
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
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        // ignore: unnecessary_null_comparison
        child: News == null
            ? Center(
                child: LoadingAnimationWidget.waveDots(
                    size: 40, color: Theme.of(context).primaryColor),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      widget.news.image,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.news.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.news.content,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
