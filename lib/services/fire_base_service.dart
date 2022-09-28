import 'dart:convert';
import 'package:contas_do_mes/helpers/auth_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'web_source.dart';

class FireBaseService {
  static const String apiKey = 'AIzaSyDgHA8FbiSM0TiQrvQo67mbDFW_tZbrkKE';
  static const String signUp = 'signUp?key=$apiKey';
  static const String signInWithPassword = 'signInWithPassword?key=$apiKey';
  static const String _urlBase = 'https://identitytoolkit.googleapis.com/v1/accounts:';
  String error = '';

  var serviceHttpWeb = ServiceHttpWeb();

  Future<bool> authenticate(String email, String password, String authType) async {
    if (authType == 'login') {
      authType = signInWithPassword;
    } else if (authType == 'register') {
      authType = signUp;
    }

    error = '';
    String body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    var response = await serviceHttpWeb.postHttp(_urlBase + authType, body);

    if (response == null) {
      debugPrint('/* ${AuthException('NOT_CONEXTION')} */ $response');
      error = '${AuthException('NOT_CONEXTION')}';

      return false;
    } else if (response['error'] != null) {
      debugPrint(response['error']['message'].toString());
      error = '${AuthException(response['error']['message'])}';

      return false;
    }
    return true;
  }
}
