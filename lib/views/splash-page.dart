import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:contas_do_mes/componets/chart-custom.dart';
import 'package:contas_do_mes/views/home-page-view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'all-list-view.dart';

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
        nextScreen:  const AllListsPage(),
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 200.5,
        //pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
