import 'package:contas_do_mes/services/web_source.dart';
import 'package:flutter/material.dart';

import '../models/coins_model.dart';
import 'repository_http_interface.dart';

class RepositoryCoins implements IHttpClient {
  // ignore: prefer_typing_uninitialized_variables
  
  List<String> coins = ['USD-BRL', 'EUR-BRL', 'BTC-BRL'];
  String url = 'https://economia.awesomeapi.com.br/json/';
  Coins? coinData;

  final _services = Services();
  @override
  Future getDataWeb( coin) async {
    var response = await _services.getHttp(url + coin);
    coinData = Coins.fromjson(response[0]);
    return coinData;
  }
}
