import 'package:contas_do_mes/services/fire_base_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../views/home_page_view.dart';

class ViewModelLogin extends ChangeNotifier {
  ViewModelLogin( this.serviceLogin);
  FireBaseService serviceLogin = FireBaseService();
  String emailAndress = '';
  String password = '';
  String passwordConfirm = '';
  bool passwordTextObscure = true;
  bool confirmPasswordTextObscure = true;
  bool logged = false;
  bool registered = false;

  final formKey = GlobalKey<FormState>();


  void submitFormRegister(BuildContext ctx){
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    } else {
      formKey.currentState!.save();
      serviceLogin
          .signup(emailAndress, password)
          .then((value) => Navigator.of(ctx).pushReplacement(
                PageTransition(
                  curve: Curves.decelerate,
                  duration: const Duration(seconds: 2),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const HomePageView(),
                ),
              ));
    }
    notifyListeners();
  }

  void submitFormSingIn(BuildContext ctx) {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    } else {
      formKey.currentState!.save();
      serviceLogin
          .signIn(emailAndress, password)
          .then((value) => Navigator.of(ctx).pushReplacement(
                PageTransition(
                  curve: Curves.decelerate,
                  duration: const Duration(seconds: 2),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const HomePageView(),
                ),
              ));
    }
    notifyListeners();
  }

  passwordValid(String p) {
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    } else if (p.length < 8) {
      return 'Senha precisar ter no mínimo 8 caracteres';
    } /* else if (password != passwordConfirm) {
      return 'Senhas são diferentes';
    }  */else {
      return null;
    }
  }

  emailValid(String p) {
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    } else if (!p.contains('@') || p.length < 5 || !p.contains('.com')) {
      return 'Email inválido';
    } else {
      return null;
    }
  }

  void passwordTConfirmVisible() {
    confirmPasswordTextObscure = !confirmPasswordTextObscure;
    notifyListeners();
  }

  void passwordVisible() {
    passwordTextObscure = !passwordTextObscure;
    notifyListeners();
  }

  bool isLogged(logged) {
    if (logged == true) {
      return true;
    } else {
      return false;
    }
  }

  bool isRegister(registered) {
    if (registered == true) {
      return true;
    } else {
      return false;
    }
  }

  registerNow() {
    registered = !registered;

    notifyListeners();
  }
}
