import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:contas_do_mes/view-models/view_model_login.dart';
import 'package:contas_do_mes/views/home_page.dart';
import 'package:contas_do_mes/views/login_page%20.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var viewModel = Provider.of<ViewModelLogin>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas do Mês'),
      ),
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: Lottie.asset('assets/images/money.json'),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: /* viewModel.isLogged(viewModel.logged) ? const HomePage() : */ const LoginPage(),
        splashIconSize: 200.0,
      ),
    );
  }
}
