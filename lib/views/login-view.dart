import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: Form(
            key: viewModelLogin.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Lottie.asset('assets/images/cadeado.json'),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    onSaved: (email) => viewModelLogin.email = (email ?? ''),
                    validator: ((value) => viewModelLogin.emailValid(value!)),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 248, 248),
                        ),
                      ),
                      labelText: 'email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    onSaved: (senha) => viewModelLogin.senha = (senha ?? ''),
                    validator: (value) => viewModelLogin.passwordValid(value!),
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 248, 248),
                        ),
                      ),
                      labelText: 'senha',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    viewModelLogin.submitForm(context);
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
