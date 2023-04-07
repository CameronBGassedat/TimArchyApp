 import 'dart:convert';
import 'package:http/http.dart' as http;

class AirluxApi {
  final Map<String, String> routeQueries = {
    "Sensor": "/sensor",
    "Room": "/room",
    "Building": "/building",
    "User": "/user",
  };

  Future<String> getCall(String route) async
  {
    var client = http.Client();
    try {
      var uri = Uri.http('10.0.2.2:3000', route);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "Error";
      }
    } finally {
      client.close();
    }
  }

  Future<String> postCall(String route, Map<String, dynamic> bodyMap) async
  {
    var client = http.Client();
    try {
      var url = Uri.http('10.0.2.2:3000', route);
      http.Response response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body : json.encode(bodyMap)
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } finally {
      client.close();
    }
  }
}