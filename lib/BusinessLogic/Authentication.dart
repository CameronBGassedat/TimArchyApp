import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Data/my_globals.dart' as globals;

class AuthenticationAirlux {
  final client = http.Client();

  Future signup(String email, String password) async {
    final String url = "http://" + globals.ip + ":3000/signup";
    final Uri uri = Uri.parse(url);
    print(uri);
    Map data = {
      'useremail': globals.userEmail.trim(),
      'userpassword': globals.userPwd.trim()
    };
    print(data);
    var bodyToSend = jsonEncode(data);
    try {
      final http.Response response = await client.post(uri,
          headers: {"Content-Type": "application/json"}, body: bodyToSend);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      }
    } catch (err) {
      print(err);
    }
  }

  Future login(String email, String password) async {
    print("EMAIL GLOBAL =>> " + globals.userEmail);
    print("MDP GLOBAL=>> " + globals.userPwd);
    final String url = "http://" + globals.ip + ":3000/login";
    print(url);
    final Uri uri = Uri.parse(url);
    Map data = {
      'newemail': globals.userEmail.trim(),
      'newpassword': globals.userPwd.trim()
    };
    var bodyToSend = jsonEncode(data);
    try {
      final http.Response response = await client.post(uri,
          headers: {"Content-Type": "application/json"}, body: bodyToSend);
      final statusCode = response.statusCode;
      final body = response.body;
      print(statusCode);
      print(response);
      if (statusCode == 200) {
        print(body);
        return body;
      }
    } catch (err) {
      print(err);
    }
  }
}
