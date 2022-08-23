import 'package:contas_do_mes/services/web_source.dart';
import '../models/coins_model.dart';
import 'repository_http_interface.dart';

class RepositoryCoins implements IHttpClient {
  List<String> coins = ['USD-BRL', 'EUR-BRL', 'BTC-BRL'];
  String url = 'https://economia.awesomeapi.com.br/json/';
  Coins? coinData;

  final _services = Services();
  @override
  Future<String> getDataWeb(coin) async {
    var response = await _services.getweb(url + coin);
    coinData = Coins.fromjson(response[0]);
    return coinData!.high;
  }
}
