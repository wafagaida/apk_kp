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
      // appBar: AppBar(
      //   title: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 18),
      //     child: Text("Beranda"),
      //   ),
      //   backgroundColor: const Color(0xFF0873A1),
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: BerandaWidget.sectionTitle(
                "Pengumuman",
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: BerandaWidget.pengumumanCard(
                size,
                "https://picsum.photos/1080/690",
                "PPDB",
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 35),
//   child: Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Car",
//           ),
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Bike",
//           ),
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Food",
//           ),
//         ],
//       ),
//       const SizedBox(height: 15),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Rent",
//           ),
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Gift Cards",
//           ),
//           BerandaWidget.menu(
//             image: "assets/images/logoSMK.png",
//             title: "Subscription",
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
