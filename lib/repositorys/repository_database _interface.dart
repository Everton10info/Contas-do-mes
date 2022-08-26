
import 'package:contas_do_mes/services/data_source.dart';

abstract class IRepositoryDb {
  ServiceDataBase db;

  IRepositoryDb(this.db);

  Future getAllTransactions();
  Future insertTransaction(transaction);
  Future deleteTransactions(id);
  Future updateTransaction(transaction);
}
