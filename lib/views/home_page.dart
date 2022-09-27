

import 'package:contas_do_mes/componets/chart_custom.dart';
import 'package:contas_do_mes/view-models/view_model_coins.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'all_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String pageName = '/homePageView';
  @override
  State<HomePage> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePage> {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    var Data = Provider.of<ViewModelCoins>(context);
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
                  padding: EdgeInsets.only(top: 10.0),
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true, signed: true),
                    controller: Data.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 248, 248),
                        ),
                      ),
                     // hintText: '00.00',
                      labelText: 'Valor para converter',
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
                      width: 70,
                      height: 70,
                      child: InkWell(
                        onTap: () async {
                          await Data.getCoins(0);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: const Card(
                          elevation: 10,
                          child: Center(
                            child: Text(
                              'Dolar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          Data.getCoins(1);
                         
                        },
                        child: const Card(
                            elevation: 10,
                            child: Center(
                              child: Text(
                                'Euro',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          Data.getCoins(2);
                          
                        },
                        child: const Card(
                            elevation: 10,
                            child: Center(
                              child: Text(
                                'Bitcoin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .015,
                ),

                Consumer<ViewModelCoins>(
                  builder: (context, Data, child) {
                    return SizedBox(
                  child: Data.loader
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Text(Data.resultLabel,
                                style: const TextStyle(
                                    color: Colors.black87, fontWeight: FontWeight.w500)),
                            Text(Data.resultValue,
                                style: const TextStyle(
                                    color: Colors.blueAccent, fontWeight: FontWeight.w700)),
                          ],
                        ),
                );
                  }),
                
                
                SizedBox(
                  height: height * .02,
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
