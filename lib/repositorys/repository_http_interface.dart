
import 'package:contas_do_mes/models/api_web.dart';
import 'package:contas_do_mes/services/web_coins_service.dart';

abstract class IHttpClient {
  ApiWeb api;
  WebCoisnService service;
  Future getDataWeb(data);

  IHttpClient(this.service, this.api);
}
