import 'package:contas_do_mes/views/form-transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-models/view-model-form.dart';

class AllListsPage extends StatefulWidget {
  const AllListsPage({Key? key}) : super(key: key);
  static const pageName = 'AllListsPage';
  @override
  State<AllListsPage> createState() => _AllListsPageState();
}

class _AllListsPageState extends State<AllListsPage> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    ViewModelForm? _viewModel = context.watch<ViewModelForm?>(); //temporariamente
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          isExtended: true,
          onPressed: () {
            Navigator.of(context).pushNamed(FormTransaction.pageName);
          }),
      appBar: AppBar(
        title: const Text('List input'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: heigth * 0.9,
            child: Consumer<ViewModelForm>(
              builder: ((context, _viewModel, child) {
                return ListView.builder(
                    itemCount: _viewModel.allList.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap:(() =>  _viewModel.deleteTr(_viewModel.allList[index].id!)),
                        child: Card(
                          child: SizedBox(
                            height: heigth * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [Text('${ _viewModel.allList[index].nameTransaction}'),
                                  Text('${ _viewModel.allList[index].valor}'),
                                  Text('${ _viewModel.allList[index].dueDate}'),
                                  Text(' ${_viewModel.allList[index].date}')],
                                ),
                                Column()
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
              }),
            ),
          ),
        ],
      ),
                        
    );
  }
}
