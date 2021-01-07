import 'dart:convert';
import 'package:flutter_assignment/data/data.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchData() async {
  final response = await http.get('http://vfwadmin.vfw.life/vfw_api/all/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Data.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load api');
  }
}