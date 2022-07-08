

import 'package:contas_do_mes/models/data-base.dart';
import 'package:contas_do_mes/models/transaction_model.dart';

abstract class IRepository {
  final List<TransactionModel>transactionsList;
  final TransactionsDataBase db;


  IRepository(this.db, this.transactionsList);

  Future getAllTransactions();
  Future insertTrasaction(transaction);
  Future deleteTransactions(id);
  Future updateTrasaction(transaction);
}
