import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ViewModelLogin>(
          builder: (context, viewModelLogin, child) {
            return SizedBox(
              child: SingleChildScrollView(
                child: Form(
                  key: viewModelLogin.formKey,
                  child: Column(
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
                          controller: viewModelLogin.emailAndress,
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
                          controller: viewModelLogin.password,
                          onSaved: (password) => viewModelLogin.password.text = password!,
                          validator: ((value) => viewModelLogin.passwordValid(value!)),
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
                      SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: viewModelLogin.passwordConfirm,
                          onSaved: (passwordConfirm) =>
                              viewModelLogin.passwordConfirm.text = passwordConfirm!,
                          validator: (value) => viewModelLogin.passwordValidConfirm(
                              value!, viewModelLogin.password.text),
                          obscureText: viewModelLogin.confirmPasswordTextObscure,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 243, 248, 248),
                              ),
                            ),
                            labelText: 'Confirmar senha',
                            suffixIcon: InkWell(
                              child: Icon(viewModelLogin.confirmPasswordTextObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onTap: () => viewModelLogin.passwordConfirmVisible(),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModelLogin.registerOrLogin();
                        },
                        child: const Text('Ir para Login ? '),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      viewModelLogin.loader
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: 600,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  viewModelLogin.submitForm(context, 'register');
                                },
                                icon: const Icon(Icons.login),
                                label: const Text('Cadastrar'),
                              ),
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
