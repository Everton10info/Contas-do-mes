import 'dart:convert';

import 'package:contas_do_mes/models/transaction_model.dart';
import 'package:contas_do_mes/repositorys/repository_database%20_interface.dart';
import 'package:contas_do_mes/services/fire_base_service.dart';
import 'package:flutter/material.dart';
import '../services/data_source.dart';
import '../models/transaction_model.dart';
import 'package:http/http.dart' as http;

class RepositoryTransactions implements IRepositoryDb {
  final _db = ServiceDataBase();
  final _url = 'https://contas-do-mes-329d3-default-rtdb.firebaseio.com';

  @override
  get db => _db;

  @override
  Future deleteTransactions(id) async {
   /*  var database = await _db.database;
    var result = await database!.delete(
      _db.nametable,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result; */
  }

  @override
  Future getAllTransactions() async {

 

   http.Response res =await http.get(Uri.parse('$_url/teste.json'));

    var data = jsonDecode(res.body);

    print('dddddddd $data');

     /* for (var element in data) {
      data.add(TransactionModel.fromjson(element));
    } */

    return  data;
  
    

    debugPrint('resssssss $res');


 /*    var _database = await _db.database;
    List<TransactionModel> transactionsList = [];
    String sql = "SELECT * FROM ${_db.nametable}";
    List<Map<String, Object?>> list = await _database!.rawQuery(sql);

    for (var element in list) {
      transactionsList.add(TransactionModel.fromjson(element));
    }

    return  transactionsList; */
  }

  @override
  Future insertTransaction(transaction) async {
    TransactionModel tr = transaction;

   http.Response res =await http.post(Uri.parse('$_url/teste.json'),
    body: jsonEncode(tr.toMap()));

    debugPrint('resssssss $res');
   

  /*   var _database = await _db.database;
    TransactionModel tr = transaction;
    var result = await _database!.insert(db.nametable, tr.toMap());

    return result; */

  }

  @override
  Future updateTransaction(transaction) async {
  /*   var _dataBase = await _db.database;
    TransactionModel tr = transaction;
    await _dataBase!.update(
      db.nametable,
      tr.toMap(),
      where: " id = ?",
      whereArgs: [tr.id],
    ); */
  }
  
  @override
  set db(_db) {

  }
}
