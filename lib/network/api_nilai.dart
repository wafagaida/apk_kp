import 'package:lms/models/nilai.dart';
import 'dart:convert';

import 'api_user.dart';

class NilaiService{
  static String baseUrl = "/student";

  static Future<List<Nilai>> getNilai() async {
    final response = await Network().getData(baseUrl);
    List<Nilai> list = parseResponse(response.body);
    return list;
  }
  
  static List<Nilai> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Nilai>((json) => Nilai.fromJson(json)).toList();
  }
}