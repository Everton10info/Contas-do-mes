import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceWeb {
  Future getHttp(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);

      return data;
    } catch (e) {
      e.toString();
    }
  }

  Future postHttp(String url, body) async {
    try {
      var response = await http.post(Uri.parse(url), body: body);
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      e.toString();
    }
  }
}
