
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:contas_do_mes/views/login-view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'user_registration_view.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas do Mês'),
      ),
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: Lottie.asset('assets/images/money.json'),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const RegisterView(),
        splashIconSize: 200.0,
      ),
    );
  }
}
