import 'package:contas_do_mes/componets/chart-custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  static String pageName = '/homePageView';

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafics'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
       
        children: [Container(height:height* 0.5 ,width: width , decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/lago.jpg'),
          fit: BoxFit.fill,
        ),
       
      ), child: const ChartCustom()),
        ]),
    );
  }
}
