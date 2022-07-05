import 'package:contas_do_mes/models/data-base.dart';
import 'package:contas_do_mes/repositorys/repository.dart';
import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum CurrentSituation { payOut, owing, received, toReceive }

class ViewModelForm extends ChangeNotifier {
  Repository rp;
  TextEditingController name = TextEditingController();
  TextEditingController value = TextEditingController();
  String? currentDate = DateTime.now().toString();
  String? dueDateTime;
  String? type;
  TransactionModel? setTransaction;
  List<TransactionModel> allList = [];

  ViewModelForm(this.rp);

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

    rp.saveList(setTransaction!);

    allList = await rp.getListAll();
    notifyListeners();
  }

  void deleteTr(int id) async {
    await rp.deleteTransaction(id);
    allList.clear();
    allList = await rp.getListAll();
    notifyListeners();
  }
}
