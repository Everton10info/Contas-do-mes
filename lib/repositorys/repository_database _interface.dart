

abstract class IRepositoryDb {
  final  db;

  IRepositoryDb(this.db);

  Future getAllTransactions();
  Future insertTransaction(transaction);
  Future deleteTransactions(id);
  Future updateTransaction(transaction);
}
