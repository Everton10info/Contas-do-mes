
import 'package:contas_do_mes/repositorys/repository_coins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/web_source.dart';
import '../view-models/view_model_form.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({Key? key}) : super(key: key);
  static String pageName = 'FormTransaction';

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    var viewModelForm = Provider.of<ViewModeFormTransaction>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre'),
      ),
      body: SizedBox(
        height: heigth * 0.5,
        child: Card(
          elevation: 20,
          margin: EdgeInsetsDirectional.only(
              top: heigth * 0.05,
              start: width * 0.05,
              end: width * 0.05,
              bottom: heigth * 0.05),
          shadowColor: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(controller: viewModelForm.name),
                TextFormField(controller: viewModelForm.value),
                IconButton(
                    onPressed: () async {
                      DateTime? temp = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      viewModelForm.dueDateTime = temp.toString();
                    },
                    icon: const Icon(Icons.dataset)),
                ElevatedButton(
                  onPressed: () {
                  
                   viewModelForm.edition?viewModelForm.editionTransactions(): viewModelForm.setTransactions();
                    viewModelForm.dueDateTime = '';
                    viewModelForm.name.text = '';
                    viewModelForm.value.text = '';
                    viewModelForm.dueDateTime = '';

                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.add_business),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
