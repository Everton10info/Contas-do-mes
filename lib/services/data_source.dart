import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionsDataBase {
//variables used for  create  table fields
  String nametable = 'tbl_transaction';
  String id = 'id';
  String nameTransaction = 'nameTransaction';
  String date = 'date';
  String dueDate = 'dueDate';
  String typeTransaction = 'typeTransaction';
  String valor = 'valor';
  String paidOut = 'paidOut';

  Database? _database;

  //initialaze db
  Future<Database?> get database async {
    //if databse null
    _database ??= await initialBase();
    return _database;
  }

  Future<Database> initialBase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'dbTransactions.db';
    var base = await openDatabase(path, version: 1, onCreate: _createTable);
    return base;
  }

  //create table
  _createTable(Database db, int versao) async {
    await db.execute('CREATE TABLE $nametable('
        '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$nameTransaction TEXT,'
        '$date DATA,'
        '$dueDate DATA,'
        '$typeTransaction TEXT,'
        '$valor DOUBLE,'
        '$paidOut INTEGER )');
  }
}
