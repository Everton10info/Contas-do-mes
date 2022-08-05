import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositorys/repository_database _interface.dart';

enum CurrentSituation { payOut, owing, received, toReceive }

class ViewModelTransaction extends ChangeNotifier {
  ViewModelTransaction(this.repository);

  IRepositoryDb repository;
  List<TransactionModel> allList = [];

  fetchAll() async {
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
