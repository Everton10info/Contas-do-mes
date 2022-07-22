import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class Services {

  Future getHttp(String url) async {
    var response;
    try {
      response = await Dio().get(url);
      debugPrint(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint('${response.data}');
    return response.data;
  }
}



//  url completa ==>  https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL