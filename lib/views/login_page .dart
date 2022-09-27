import 'package:contas_do_mes/componets/login_widget.dart';
import 'package:contas_do_mes/componets/register_widget%20.dart';
import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String pageName = "/loginView";

  @override
  State<LoginPage> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var viewModelLogin = Provider.of<ViewModelLogin>(context);
    return viewModelLogin.registered
        ? RegisterWidget(
            viewModelLogin: viewModelLogin,
          )
        : LoginWidget(
            viewModelLogin: viewModelLogin,
          );
  }
}
