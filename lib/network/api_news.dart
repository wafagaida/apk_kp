import 'package:http/http.dart' as http;
import 'package:lms/models/news.dart';
import 'package:lms/network/api_user.dart';
import 'package:lms/network/constants.dart';
import 'dart:convert';

import 'api_response.dart';

// Future<ApiResponse> getNews() async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.get(Uri.parse(newsUrl),
//     headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });

//     switch(response.statusCode){
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['news'].map((p) => News.fromJson(p)).toList();
//         // we get list of posts, so we need to map each item to post model
//         apiResponse.data as List<dynamic>;
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   }
//   catch (e){
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }
// class ApiNews {
  //  String baseUrl = "/news";

   Future<List<News>> getNews() async {
    final response = await Network().getData(newsUrl);
    List<News> list = parseResponse(response.body);
    return list;
  }

   List<News> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  }
  Future<List<News>> fetchAllNews() async {
    final response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> newsJson = jsonDecode(response.body);
      return newsJson.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
// }
