import 'package:contas_do_mes/models/api_web.dart';
import 'package:contas_do_mes/services/web_source.dart';
import '../models/coins_model.dart';
import 'repository_http_interface.dart';

class RepositoryCoins implements IHttpClient {
  @override
  ApiWeb api = ApiWeb();
  
  @override
  ServiceWeb service = ServiceWeb();

  Coins? coinData;

  @override
  Future<Coins?> getDataWeb(url) async {
    var response = await service.getHttp(url);
    if (response != null) {
      coinData = Coins.fromjson(response[0]);
      return coinData;
    }
    return null;
  }

  

  
}
