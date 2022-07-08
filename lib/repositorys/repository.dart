import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:contas_do_mes/repositorys/repository-database%20-interface.dart';
import 'package:sqflite/sqflite.dart';

import '../models/data-base.dart';
import '../models/transaction_model.dart';

class Repository implements IRepository {
  final TransactionsDataBase _db = TransactionsDataBase();
  @override
  TransactionsDataBase get db => _db;

  final List<TransactionModel> _transactionsList = [];
  @override
  List<TransactionModel> get transactionsList => _transactionsList;



  
  @override
  Future deleteTransactions(id) async {
   var database = await  _db.database;
    var result = await database!.delete(
      _db.nametable,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  Future getAllTransactions() async {
    var database = await  _db.database;
    String sql = "SELECT * FROM ${_db.nametable}";
    List<Map<String, Object?>> list = await database!.rawQuery(sql);

    for (var element in list) {
      transactionsList.add(TransactionModel.fromjson(element));
    }

    return transactionsList;
  }

  @override
  Future insertTrasaction(transaction) async {
      var database = await  _db.database;
    TransactionModel tr = transaction;
    var result = await database!.insert(db.nametable, tr.toMap());
    return result;
  }

  @override
  Future updateTrasaction(transaction) {
    // TODO: implement updateTrasaction
    throw UnimplementedError();
  }
}
