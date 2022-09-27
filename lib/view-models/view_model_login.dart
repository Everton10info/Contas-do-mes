import 'package:contas_do_mes/services/fire_base_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../views/home_page.dart';

class ViewModelLogin extends ChangeNotifier {
  ViewModelLogin(this.serviceLogin);
  FireBaseService serviceLogin = FireBaseService();
  var emailAndress = TextEditingController();
  var password = TextEditingController();
  var passwordConfirm = TextEditingController();
  bool passwordTextObscure = true;
  bool confirmPasswordTextObscure = true;
  bool logged = false;
  bool registered = false;

  final formKey = GlobalKey<FormState>();

  void submitFormRegister(BuildContext ctx) {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    } else {
      formKey.currentState!.save();

      serviceLogin.authenticate(emailAndress.text, password.text,'register').then((value) {
        if (value) {
          Navigator.of(ctx).pushReplacement(
            PageTransition(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 2),
              type: PageTransitionType.scale,
              alignment: Alignment.center,
              child: const HomePage(),
            ),
          );
        } else {
          
          showDialog(
              context: ctx,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text('Erro!'),
                  content: Text(serviceLogin.error),
                  backgroundColor: Colors.amber[50],
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(ctx, true);
                        },
                        icon: const Icon(Icons.close))
                  ],
                );
              });
        }
      });
    }
    notifyListeners();
  }

  void submitFormSingIn(BuildContext ctx) {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    } else {
      formKey.currentState!.save();
      serviceLogin.authenticate(emailAndress.text, password.text, 'login').then((value) {
        if (value) {
          Navigator.of(ctx).pushReplacement(
            PageTransition(
              curve: Curves.decelerate,
              duration: const Duration(seconds: 2),
              type: PageTransitionType.scale,
              alignment: Alignment.center,
              child: const HomePage(),
            ),
          );
        } else {
          showDialog(
              context: ctx,
              builder: (ctx) {
                return AlertDialog(
                  elevation: 30,
                  title: const Text('OPS!',style: TextStyle(fontSize: 25)),
                  content: Text(serviceLogin.error, style: const TextStyle(fontSize: 20),textAlign: TextAlign.justify, ),
                  backgroundColor: Colors.amber[50],
                  actions: [
                    IconButton(
                      color: Colors.redAccent,
                        onPressed: () {
                          Navigator.pop(ctx, true);
                        },
                        icon: const Icon(Icons.close))
                  ],
                );
              });
        }
      });
    }
    notifyListeners();
  }

  passwordValid(String p) {
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    } else if (p.length < 8) {
      return 'Senha precisar ter no mínimo 8 caracteres';
    } else {
      return null;
    }
  }

  passwordValidConfirm(String p) {
     debugPrint('aaaaaaaaa'+password.text+'======='+passwordConfirm.text);
    if (p.isEmpty) {
      return 'Campo não pode ser vázio!';
    } else if (p.length < 8) {
      return 'Senha precisar ter no mínimo 8 caracteres';
    } else if (password.text != passwordConfirm.text) {
      debugPrint('aaaaaaaaa'+password.text+'======='+passwordConfirm.text);
      return 'Senhas são diferentes';
    } else {
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

  registerNow() {
    registered = !registered;

    notifyListeners();
  }
}
