import 'package:dio/dio.dart';
void getHttp(String url, String coin) async {
  try {
    var response = await Dio().get('$url+$coin');
    print(response.data);
  } catch (e) {
    print(e);
  }
}



//  url completa ==>  https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL