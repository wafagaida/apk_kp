import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lms/network/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  // ignore: prefer_typing_uninitialized_variables
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  auth(data, apiURL) async{
    var fullUrl = ApiConstants.baseUrl + apiURL;
    Uri url = Uri.parse(fullUrl);

    return await http.post(
      url,
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  getData(apiURL) async{
    var fullUrl = ApiConstants.baseUrl + apiURL;
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