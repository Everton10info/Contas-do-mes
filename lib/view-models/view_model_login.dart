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
  bool registerNow = false;
  bool loader = false;

 

  final formKey = GlobalKey<FormState>();

  void submitForm(BuildContext ctx, String authType) {
    circularProgressIndicator();
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      circularProgressIndicator();
      return;
    } else {
      formKey.currentState!.save();
      serviceLogin.authenticate(emailAndress.text, password.text, authType).then((value) {
        circularProgressIndicator();

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
          circularProgressIndicator();
          showDialog(
              context: ctx,
              builder: (ctx) {
                return AlertDialog(
                  elevation: 30,
                  title: Row(
                    children: const [
                      Icon(
                        Icons.report_problem_outlined,
                        color: Colors.amber,
                      ),
                      Text(' Ops! ', style: TextStyle(fontSize: 20, color: Colors.red)),
                    ],
                  ),
                  content: Text(
                    serviceLogin.error,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.amber[50],
                  actions: [
                    IconButton(
                        color: const Color.fromARGB(255, 161, 32, 32),
                        onPressed: () {
                          Navigator.pop(ctx, true);
                        },
                        icon: const Icon(Icons.close))
                  ],
                );
              });
          circularProgressIndicator();
        }
      });
    }
  }

  circularProgressIndicator() {
    loader = !loader;
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

  passwordValidConfirm(String p1, String p2) {
    if (p1.isEmpty) {
      return 'Campo não pode ser vázio!';
    } else if (p1.length < 8) {
      return 'Senha precisar ter no mínimo 8 caracteres';
    } else if (p1 != password.text) {
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

  void passwordConfirmVisible() {
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

  registerOrLogin() {
    registerNow = !registerNow;
    notifyListeners();
  }
}
