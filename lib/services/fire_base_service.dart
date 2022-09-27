import 'dart:convert';

import 'package:contas_do_mes/services/auth_exceptions.dart';
import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'web_source.dart';

class FireBaseService {
  static const String apiKey = 'AIzaSyDgHA8FbiSM0TiQrvQo67mbDFW_tZbrkKE';
  static const String signUp = 'signUp?key=$apiKey';
  static const String signInWithPassword = 'signInWithPassword?key=$apiKey';
  static const String _urlBase = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  var serviceWeb = ServiceWeb();

  Future<void> signup(String email, String password) async {
    String body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    var response = await serviceWeb.postHttp(_urlBase + signUp, body);

    debugPrint(
        'errorrrrr + ${response['error']['message']}  '); 
   // throw AuthException(response['error']['message']);
  }

  Future<void> signIn(String email, String password) async {
 String body = jsonEncode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    });

    var response = await serviceWeb.postHttp(_urlBase + signInWithPassword, body);
   


   debugPrint('${AuthException(response['error']['message'].toString())}');
   
 }

  
}
