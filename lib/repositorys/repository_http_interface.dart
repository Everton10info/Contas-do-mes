
import 'package:contas_do_mes/models/api_web.dart';
import 'package:contas_do_mes/services/web_source.dart';

abstract class IHttpClient {
  ApiWeb api;
  ServiceHttpWeb service;
  Future getDataWeb(data);

  IHttpClient(this.service, this.api);
}
