import 'dart:convert';

import 'package:lms/models/user.dart';
import 'package:lms/network/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  // ignore: prefer_typing_uninitialized_variables
  var token;

  _getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
  }

  auth(data, apiURL) async {
    var fullUrl = baseUrl + apiURL;
    Uri url = Uri.parse(fullUrl);

    return await http.post(url, body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = baseUrl + apiURL;
    Uri url = Uri.parse(fullUrl);

    await _getToken();
    return await http.get(
      url,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(postUrl),
      headers: {
        "Accept": 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 404:
        final errors = jsonDecode(response.body)['message'];
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? "";
}

Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
