// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String username, password;

  User({required this.username, required this.password});

  factory User.getUser(Map<String, dynamic> json) {
    return User(username: json['nisn'], password: json['password']);
  }

  Object? get id => null;
  static Future<User> connectToApi(String username, password_) async {
    String apiUrl = "http://192.168.50.2:8000/api/user/id=" +
        username +
        "&pass=" +
        password_;
    var response = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(response.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.getUser(userData[0]);
  }
}
