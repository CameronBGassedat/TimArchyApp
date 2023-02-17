import 'dart:convert';
import 'package:http/http.dart' as http;

void getCall(String route)
async {
    var client = http.Client();
    try {
      var uri = Uri.http('localhost:3000', route);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        print(data);
      } else {
        print(response.statusCode);
      }
    } finally {
      client.close();
    }
}

void postCall(String route, Map<String, String> bodymap)
  async {
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
        String data = response.body;
        print(data);
      } else {
        print(response.statusCode);
      }
    } finally {
    client.close();
  }
}
