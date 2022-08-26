import 'package:dio/dio.dart';

class ServiceWeb {
  Future getHttp(String url) async {
    try {
      Response? response;
      response = await Dio().get(url);

      return response.data;
    } catch (e) {
      e.toString();
    }
  }
}
