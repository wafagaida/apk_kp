import 'dart:convert';
import 'dart:developer';

import 'package:lms/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String apiUrl;

  UserService(this.apiUrl);

  Future<User> getUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching user: $e');
      throw e;
    }
  }
}

//   Future<User> getUsers() async {
//     // User? result;
//     try {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       final token = localStorage.getString('token');

//       Map<String, String> headers = {"Authorization": "Bearer $token"};
//       final url = Uri.parse(ApiConstants.users);
//       final response = await http.get(url, headers: headers);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         return User.fromJson(data);
//       } else {
//         throw Exception('Data Tidak Ditemukan');
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     // return null;
//     // return result;
//   }
// }
