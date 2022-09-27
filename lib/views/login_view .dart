import 'package:contas_do_mes/componets/login_widget.dart';
import 'package:contas_do_mes/componets/register_widget%20.dart';
import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static String pageName = "/loginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var viewModelLogin = Provider.of<ViewModelLogin>(context);
    return viewModelLogin.isRegister(viewModelLogin.registered)
        ? RegisterWidget(
            viewModelLogin: viewModelLogin,
          )
        : LoginWidget(
            viewModelLogin: viewModelLogin,
          );
  }
}
