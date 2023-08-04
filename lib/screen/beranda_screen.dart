import 'package:flutter/material.dart';
import 'package:lms/models/user.dart';
import 'package:lms/screen/beranda_screen_widget.dart';

// import 'home_fragment_widgets.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({
    super.key,
    required this.user,
    required this.homeScaffold,
  });
  final User user;
  final GlobalKey<ScaffoldState> homeScaffold;

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          BerandaWidget.header(
            user: widget.user,
            homeScaffoldState: widget.homeScaffold,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: BerandaWidget.cardMenu(),
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
    );
  }
}
