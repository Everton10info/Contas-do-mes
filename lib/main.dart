import 'package:contas_do_mes/repositorys/repository_coins.dart';
import 'package:contas_do_mes/repositorys/repository_transactions.dart';
import 'package:contas_do_mes/services/fire_base_service.dart';
import 'package:contas_do_mes/view-models/view_model_form_transaction.dart';
import 'package:contas_do_mes/view-models/view_model_transaction.dart';
import 'package:contas_do_mes/views/form_transaction_page.dart';
import 'package:contas_do_mes/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view-models/view_model_coins.dart';
import 'view-models/view_model_login.dart';
import 'views/all_list_page.dart';
import 'views/login_page .dart';
import 'views/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ViewModeFormTransaction(RepositoryTransactions()),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelTransaction(RepositoryTransactions()),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelCoins(RepositoryCoins()),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelLogin(FireBaseService()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contas do Mês',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 136, 108, 211),
          secondaryHeaderColor: const Color.fromARGB(255, 82, 147, 158),
          cardColor: const Color.fromARGB(255, 243, 241, 247)),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        LoginPage.pageName: (context) => const LoginPage(),
        HomePage.pageName: (context) => const HomePage(),
        FormTransactionPage.pageName: (context) => const FormTransactionPage(),
        AllListsPage.pageName: (context) => const AllListsPage(),
        // 'list-output':(context) => ListOutput();
        // 'list-input':(context)=> ListInput();
      },
    );
  }
}
