import 'dart:convert';
import 'package:contas_do_mes/helpers/auth_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'web_coins_service.dart';

class FireBaseService {
  static const String apiKey = 'AIzaSyDgHA8FbiSM0TiQrvQo67mbDFW_tZbrkKE';
  static const String signUp = 'signUp?key=$apiKey';
  static const String signInWithPassword = 'signInWithPassword?key=$apiKey';
  static const String _urlBase ='https://identitytoolkit.googleapis.com/v1/accounts:';
  String error = '';

  String? _email;
  String? _token;
  String? _uid;
  DateTime? _expiryDate;

  bool get isAuth {
    final isvalid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isvalid; //retorna true ou false
  }

  var webCoisnService = WebCoisnService();

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

    var response = await webCoisnService.postHttp(_urlBase + authType, body);

    if (response == null) {
      debugPrint('$response');
      debugPrint('/* ${AuthException('NOT_CONEXTION')} */ $response');
      error = '${AuthException('NOT_CONEXTION')}';

      return false;
    } else if (response['error'] != null) {
       debugPrint(response['error']['message'].toString());
      error = '${AuthException(response['error']['message'])}';

      return false;
    } else {
      _email = response['email'];
      _token = response['idToken'];
      _uid = response['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(response['expiresIn']),
        ),
      );

      debugPrint(
          ' valido ? $isAuth  // data exp == $_expiryDate / email =$_email / localId = $_uid  /  token = $_token  ');
    }

    return true;
  }
}
