import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:flutter/foundation.dart';
import '../models/data-base.dart';

class Repository {
  TransactionsDataBase db;
  List<TransactionModel> listAllTransactions = [];

  Repository(this.db);

  saveList(TransactionModel set) {
    db.insertTransaction(set);
    debugPrint('inseeeerrrt');
  }

  Future<List<TransactionModel>> getListAll() async {
    await db.listTransactions().then((transactions) {
      for (var transaction in transactions) {
        listAllTransactions.add(TransactionModel.fromjson(transaction));
      }
      debugPrint('$listAllTransactions');
    });
    return listAllTransactions;
  }

  Future<int> deleteTransaction(int idDelete) async {
    int result = await db.clearTransaction(idDelete);
    return result;
  }
}
