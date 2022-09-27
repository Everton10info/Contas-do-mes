import 'dart:convert';
import 'package:contas_do_mes/services/auth_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'web_source.dart';

class FireBaseService {
  static const String apiKey = 'AIzaSyDgHA8FbiSM0TiQrvQo67mbDFW_tZbrkKE';
  static const String signUp = 'signUp?key=$apiKey';
  static const String signInWithPassword = 'signInWithPassword?key=$apiKey';
  static const String _urlBase = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  var serviceHttpWeb = ServiceHttpWeb();

  Future<bool> signup(String email, String password) async {
    String body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    var response = await serviceHttpWeb.postHttp(_urlBase + signUp, body);

    if (response == null) {
      debugPrint('${AuthException('NOT_CONEXTION')}');
      return false;
    } else if (response['error'] != null) {
      debugPrint('${AuthException(response['error']['message'].toString())}');
      return false;
    }
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    String body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    var response = await serviceHttpWeb.postHttp(_urlBase + signInWithPassword, body);
    if (response == null) {
      debugPrint('${AuthException('NOT_CONEXTION')}');
      return false;
    } else if (response['error'] != null) {
      debugPrint('${AuthException(response['error']['message'].toString())}');
      return false;
    }
    return true;
  }
}
