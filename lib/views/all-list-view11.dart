
import 'package:contas_do_mes/view-models/view_model_transaction.dart';
import 'package:contas_do_mes/views/form-transaction.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../repositorys/repository_coins.dart';
import '../view-models/view_model_form.dart';

class AllListsPage11 extends StatefulWidget {
  const AllListsPage11({Key? key}) : super(key: key);
  static const pageName = 'AllListsPage11';

  @override
  State<AllListsPage11> createState() => _AllListsPage11State();
}

class _AllListsPage11State extends State<AllListsPage11> {
  @override
  Widget build(BuildContext context) {
   var viewModelTransaction = Provider.of<ViewModelTransaction>(context);
    viewModelTransaction.fetchAll();
 var viewModelForm = Provider.of<ViewModeFormTransaction>(context);
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
            child: Consumer<ViewModelTransaction>(
              builder: ((context, viewModelTransaction, __) {
                return ListView.builder(
                  itemCount: viewModelTransaction.allList.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                     onTap: (() =>
                         viewModelTransaction.deleteTransaction(viewModelTransaction.allList[index].id!)),
                     onDoubleTap: () {
                       viewModelForm.getTransaction(viewModelTransaction.allList[index]);
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
                                  Text(viewModelTransaction.allList[index].nameTransaction),
                                  Text('${viewModelTransaction.allList[index].valor}'),
                                  Text('${viewModelTransaction.allList[index].dueDate}'),
                                  Text(' ${viewModelTransaction.allList[index].date}')
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
