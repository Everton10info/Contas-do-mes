import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:flutter/material.dart';

import 'web_source.dart';

class FireBaseService {
  static const String token = 'AIzaSyDgHA8FbiSM0TiQrvQo67mbDFW_tZbrkKE';
  static const String _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$token';

  var serviceWeb = ServiceWeb();

  Future<void> signup(String email, String password) async {
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    var response = await serviceWeb.postHttp(_url,  data);

    debugPrint('eeee maaa illl' + email);
    debugPrint(response.toString());
  }
}
