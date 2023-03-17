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
    String responseBody;
    var client = http.Client();
    try {
      var uri = Uri.http('10.0.2.2:3000', route);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        responseBody = response.body;
      } else {
        responseBody = "Error";
        print("Error Status Code : ${response.statusCode}");
      }
    } finally {
      client.close();
    }
    return responseBody;
  }

  Future<String> postCall(String route, Map<String, String> bodymap) async
  {
    String result;
    var client = http.Client();
    try {
      var url = Uri.http('10.0.2.2:3000', route);
      http.Response response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body : json.encode(bodymap)
      );
      if (response.statusCode == 200) {
        result = response.body;
      } else {
        result = response.body;
        print(response.statusCode);
      }
    } finally {
      client.close();
    }
    return result;
  }
}