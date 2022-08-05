import 'package:contas_do_mes/componets/chart_custom.dart';
import 'package:contas_do_mes/view-models/view_model_coins.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'all_list_view.dart';


class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  static String pageName = '/homePageView';
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    var coins = Provider.of<ViewModelCoins>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AllListsPage.pageName),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
        title: const Text('Grafics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Despesas dos últimos meses',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                  child: const LineChartSample2(),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Conversão de moedas',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    controller: coins.value,
                    decoration: const InputDecoration(
                      
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 248, 248),
                        ),
                      ),
                      hintText: '00.00',
                      labelText: 'valor',
                      prefixIcon: Icon(
                        Icons.price_change,
                        color: Colors.blueAccent,
                      ),
                      suffixText: 'R\$',
                      suffixStyle: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                        coins.getCoins(0);
                        FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Card(
                          child: coins.coinsValueReturn != 0
                              ? (Text(
                                  coins.coinsValueReturn.toStringAsFixed(2),
                                  textAlign: TextAlign.center,
                                ))
                              : const Icon(Icons.money_off_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                       onTap: () {
                        coins.getCoins(1);
                        FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Card(
                          child: coins.coinsValueReturn != 0
                              ? (Text(
                                  coins.coinsValueReturn.toStringAsFixed(2),
                                  textAlign: TextAlign.center,
                                ))
                              : const Icon(Icons.money_off_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                        coins.getCoins(0);
                        FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Card(
                          child: coins.coinsValueReturn != 0
                              ? (Text(
                                  coins.coinsValueReturn.toStringAsFixed(2),
                                  textAlign: TextAlign.center,
                                ))
                              : const Icon(Icons.money_off_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .08,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageTransition(
                        curve: Curves.decelerate,
                        duration: const Duration(seconds: 2),
                        type: PageTransitionType.scale,
                        alignment: Alignment.center,
                        child: const AllListsPage(),
                      ));
                    },
                    child: SizedBox(
                      height: height * 0.06,
                      width: width * 0.65,
                      child: const Card(
                        child: Text('data'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
