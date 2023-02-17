import 'dart:convert';
import 'package:http/http.dart' as http;

class AirluxApi {

  Future<String> getCall(String route) async
  {
    var result;
    var client = http.Client();
    try {
      var uri = Uri.http('localhost:3000', route);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        result = response.body;
        //print(result);
      } else {
        print(response.statusCode);
      }
    } finally {
      client.close();
    }
    return result;
  }


  Future<String> postCall(String route, Map<String, String> bodymap) async
  {
    var result;
    var client = http.Client();
    try {
      var url = Uri.http('localhost:3000', route);
      http.Response response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body : json.encode(bodymap)
      );
      if (response.statusCode == 200) {
        result = response.body;
        //print(result);
      } else {
        print(response.statusCode);
      }
    } finally {
      client.close();
    }
    return result;
  }
}