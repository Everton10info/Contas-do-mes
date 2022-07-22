import 'package:contas_do_mes/repositorys/repository_transactions.dart';
import 'package:contas_do_mes/view-models/view_model_form.dart';
import 'package:contas_do_mes/view-models/view_model_transaction.dart';
import 'package:contas_do_mes/views/all-list-view.dart';
import 'package:contas_do_mes/views/form-transaction.dart';
import 'package:contas_do_mes/views/home-page-view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/splash-page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ViewModeForm(RepositoryTransactions()),
      ),
       ChangeNotifierProvider(
        create: (_) => ViewModelTransaction(RepositoryTransactions()),
      )
    ],
    child: const MyApp(),
  ));
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
        HomePageView.pageName: (context) => const HomePageView(),
        FormTransaction.pageName: (context) => const FormTransaction(),
        AllListsPage.pageName: (context) => const AllListsPage(),
        // 'list-output':(context) => ListOutput();
        // 'list-input':(context)=> ListInput();
      },
    );
  }
}
