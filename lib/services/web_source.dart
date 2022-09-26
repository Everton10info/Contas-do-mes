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

  Future postHttp(String url, data) async {
    try {
      Response? response;
      await Dio().post(url, data: data);

      return response;
    } catch (e) {
      e.toString();
    }
  }
}
