import 'package:contas_do_mes/models/data-base.dart';
import 'package:contas_do_mes/repositorys/repository.dart';
import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositorys/repository-database -interface.dart';


enum CurrentSituation { payOut, owing, received, toReceive }

class ViewModelForm extends ChangeNotifier {
  IRepository repository;
  TextEditingController name = TextEditingController();
  TextEditingController value = TextEditingController();
  String? currentDate = DateTime.now().toString();
  String? dueDateTime;
  String? type;
  TransactionModel? setTransaction;
  List<TransactionModel> allList = [];

  ViewModelForm(this.repository );

  void setTransactions() async {
    allList.clear();
    setTransaction = TransactionModel(
      id: null,
      nameTransaction: name.text,
      date: currentDate,
      dueDate: dueDateTime,
      typeTransaction: 'output',
      valor: double.parse(value.text),
    );
    repository.insertTrasaction(setTransaction!);

    allList = await repository.getAllTransactions();
    notifyListeners();
  }

  void deleteTransaction(int id) async {
    await repository.deleteTransactions(id);
    allList.clear();
    allList = await repository.getAllTransactions();
    notifyListeners();
  }
}
