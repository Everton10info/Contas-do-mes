import 'package:contas_do_mes/componets/register_widget%20.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../view-models/view_model_login.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                          onSaved: (value) => viewModelLogin.emailAndress.text = value!,
                          validator: ((value) => viewModelLogin.emailValid(value!)),
                          controller: viewModelLogin.emailAndress,
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
                          onSaved: (value) => viewModelLogin.password.text = value!,
                          controller: viewModelLogin.password,
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
                      TextButton(
                        onPressed: () {
                          viewModelLogin.registerOrLogin();
                        },
                        child: const Text('Ir para cadastro ?'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      viewModelLogin.loader
                          ? const CircularProgressIndicator()
                          : SizedBox(width: 600,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                 
                                  viewModelLogin.submitForm(context, 'login');
                                },
                                icon: const Icon(Icons.login),
                                label: const Text('Login'),
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
