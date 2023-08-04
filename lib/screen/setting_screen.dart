import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
    // required this.user,
  });
  // final User user;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Pengaturan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0873A1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(children: [
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size(500, 50),
                  elevation: 4,
                  backgroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ubah Password",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 145),
                    Icon(
                      Icons.lock_open_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size(500, 50),
                  elevation: 4,
                  backgroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Tentang",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 145),
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  // logOut();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size(500, 50),
                  elevation: 4,
                  backgroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Keluar",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 145),
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              // TextFormField(
              //   onTap: () {},
              //   // controller: _nameController,
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     isDense: true,
              //     hintText: "lalalall",
              //     suffixIcon: const ImageIcon(
              //       AssetImage('assets/images/jurusan.png'),
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(4),
              //     ),
              //   ),
              // ),
            ]),
          ),
        ],
      ),
    );
  }
}

// logOut() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       preferences.remove("is_login");
//       preferences.remove("email");
//     });

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => const LoginScreen(),
//       ),
//       (route) => false,
//     );
// }