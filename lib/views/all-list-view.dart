
import 'package:contas_do_mes/views/form-transaction.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../repositorys/repository_coins.dart';
import '../view-models/view_model_form.dart';

class AllListsPage extends StatefulWidget {
  const AllListsPage({Key? key}) : super(key: key);
  static const pageName = 'AllListsPage';

  @override
  State<AllListsPage> createState() => _AllListsPageState();
}
var rp =RepositoryCoins();
class _AllListsPageState extends State<AllListsPage> {
  @override
  Widget build(BuildContext context) {
   var _viewModelDb = Provider.of<ViewModelDBTransactions>(context);
    _viewModelDb.fetchAll();

    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List input'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: heigth * 0.75,
            child: Consumer<ViewModelDBTransactions>(
              builder: ((context, _viewModelDb, __) {
                return ListView.builder(
                  itemCount: _viewModelDb.allList.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                     onTap: (() =>
                         _viewModelDb.deleteTransaction(_viewModelDb.allList[index].id!)),
                     onDoubleTap: () {
                       _viewModelDb.getTransaction(_viewModelDb.allList[index]);
                       Navigator.of(context).pushNamed(FormTransaction.pageName);
                  },
                      child: Card(
                        child: SizedBox(
                          height: heigth * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(_viewModelDb.allList[index].nameTransaction),
                                  Text('${_viewModelDb.allList[index].valor}'),
                                  Text('${_viewModelDb.allList[index].dueDate}'),
                                  Text(' ${_viewModelDb.allList[index].date}')
                                ],
                              ),
                              Column()
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
          ElevatedButton(
              style: const ButtonStyle(
                animationDuration: Duration(seconds: 3),
              ),
              onPressed: () {
                  rp.getDataWeb(rp.coins[0]);
                Navigator.of(context).push(PageTransition(
                  curve: Curves.decelerate,
                  duration: const Duration(seconds: 2),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: const FormTransaction(),
                ));
              
              },
              child: const Text('Adicinar transação'))
        ],
      ),
    );
  }
}
