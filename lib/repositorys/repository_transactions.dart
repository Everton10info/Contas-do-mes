import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:contas_do_mes/repositorys/repository_database%20_interface.dart';
import '../services/data_source.dart';
import '../models/transaction_model.dart';

class RepositoryTransactions implements IRepositoryDb {
  final _db = TransactionsDataBase();
  @override
  get db => _db;



  @override
  Future deleteTransactions(id) async {
    var database = await _db.database;
    var result = await database!.delete(
      _db.nametable,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result;
  }

  @override
  Future getAllTransactions() async {
    var _database = await _db.database;
    List<TransactionModel> transactionsList = [];
    String sql = "SELECT * FROM ${_db.nametable}";
    List<Map<String, Object?>> list = await _database!.rawQuery(sql);

    for (var element in list) {
      transactionsList.add(TransactionModel.fromjson(element));
    }

    return  transactionsList;
  }

  @override
  Future insertTransaction(transaction) async {
    var _database = await _db.database;
    TransactionModel tr = transaction;
    var result = await _database!.insert(db.nametable, tr.toMap());

    return result;
  }

  @override
  Future updateTransaction(transaction) async {
    var _dataBase = await _db.database;
    TransactionModel tr = transaction;
    await _dataBase!.update(
      db.nametable,
      tr.toMap(),
      where: " id = ?",
      whereArgs: [tr.id],
    );
  }
}
