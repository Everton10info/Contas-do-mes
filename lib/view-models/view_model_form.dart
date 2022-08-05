import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:contas_do_mes/repositorys/repository_transactions.dart';
import 'package:contas_do_mes/view-models/view_model_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositorys/repository_database _interface.dart';

enum CurrentSituation { payOut, owing, received, toReceive }

class ViewModeFormTransaction extends ChangeNotifier {
  ViewModeFormTransaction(this.repository);

  IRepositoryDb repository;
  TextEditingController name = TextEditingController();
  TextEditingController value = TextEditingController();
  String? currentDate = DateTime.now().toString();
  String? dueDateTime;
  String? type;
  TransactionModel? setTransaction;
  bool edition = false;
  var viewModelTransaction = ViewModelTransaction(RepositoryTransactions());

  void setTransactions() async {
    setTransaction = TransactionModel(
      id: null,
      nameTransaction: name.text,
      date: currentDate,
      dueDate: dueDateTime,
      typeTransaction: 'output',
      valor: double.parse(value.text),
    );
    await repository.insertTransaction(setTransaction!);
    viewModelTransaction.allList = await repository.getAllTransactions();

    notifyListeners();
  }

  getTransaction(transaction) async {
    TransactionModel tr = transaction;
    name.text = tr.nameTransaction;
    value.text = tr.valor.toString();
    edition = true;
    setTransaction = TransactionModel(
      id: tr.id,
      nameTransaction: name.text,
      date: tr.date,
      dueDate: tr.dueDate,
      typeTransaction: tr.typeTransaction,
      valor: double.parse(value.text),
    );

    notifyListeners();
    return setTransaction;
  }

  editionTransactions() async {
    TransactionModel tr = setTransaction!;
    var editionUpdate = TransactionModel(
      id: tr.id,
      nameTransaction: name.text,
      date: tr.date,
      dueDate: dueDateTime ?? tr.dueDate,
      typeTransaction: tr.typeTransaction,
      valor: double.parse(value.text),
    );
    viewModelTransaction.allList.clear();
    await repository.updateTransaction(editionUpdate);
    viewModelTransaction.allList = await repository.getAllTransactions();
    edition = false;
    name.text = '';
    value.text = '';
    notifyListeners();
  }
}
