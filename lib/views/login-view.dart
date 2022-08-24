import 'package:contas_do_mes/views/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static String pageName = "/loginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
           
            children: [
              const SizedBox(height: 70,),
               SizedBox(
           
            height: 100,
            child: Lottie.asset('assets/images/cadeado.json'),
          ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 243, 248, 248),
                    ),
                  ),
                  labelText: 'email',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 243, 248, 248),
                    ),
                  ),
                  labelText: 'senha',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                   Navigator.of(context).pushReplacement(PageTransition(
                        curve: Curves.decelerate,
                        duration: const Duration(seconds: 2),
                        type: PageTransitionType.scale,
                        alignment: Alignment.center,
                        child: const HomePageView(),
                      ));
                  
                },
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
