import 'package:contas_do_mes/componets/register_widget%20.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../view-models/view_model_login.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key, required this.viewModelLogin}) : super(key: key);
  final ViewModelLogin viewModelLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer(
          builder: (context, value, Widget? child) {
            return SizedBox(
              child: SingleChildScrollView(
                child: Form(
                  key: viewModelLogin.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 120,
                        child: Lottie.asset('assets/images/cadeado.json'),
                      ),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          onSaved: (email) => viewModelLogin.emailAndress.text = email!,
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
                        height: 5,
                      ),
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          onSaved: (password) => viewModelLogin.password.text = password!,
                          validator: (value) => viewModelLogin.passwordValid(value!),
                          obscureText: viewModelLogin.passwordTextObscure,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 243, 248, 248),
                              ),
                            ),
                            labelText: 'senha',
                            suffixIcon: InkWell(
                              child: Icon(viewModelLogin.passwordTextObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onTap: () => viewModelLogin.passwordVisible(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          viewModelLogin.registerNow();
                        },
                        child: const Text('Fazer Cadastro'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          viewModelLogin.submitFormSingIn(context);
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Login'),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
