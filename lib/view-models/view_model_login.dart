import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../views/home_page_view.dart';

class ViewModelLogin extends ChangeNotifier {
  String email = '';
  String senha = '';
  final formKey = GlobalKey<FormState>();

  void submitForm(BuildContext ctx) {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }else{

    Navigator.of( ctx).pushReplacement(
      PageTransition(
        curve: Curves.decelerate,
        duration: const Duration(seconds: 2),
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        child: const HomePageView(),
      ),
    );
    }
  }

  passwordValid(String p) {
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    }else
    if (p.length < 8) {
      return 'Senha precisar ter no mínimo 8 caracteres';
    }else{

    return null;
    }
  }

   emailValid(String p) {
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    }else
    if (!p.contains('@') || p.length<5) {
      return 'Email inválido';
    }else{

    return null;
    }
  }
}
