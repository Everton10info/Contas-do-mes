
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'transaction_model.dart';


class TransactionsDataBase {


//variáveis usadas para criar a tabela

  String nametable = 'tbl_transaction';
  String id = 'id';
  String nameTransaction = 'nameTransaction';
  String date = 'date';
  String dueDate = 'dueDate';
  String typeTransaction = 'typeTransaction';
  String valor = 'valor';

    Database? _database;

  //inicializa o banco
Future<Database?> get database async{
  // ignore: unnecessary_null_comparison, prefer_conditional_assignment
  if(_database == null ){
    _database = await initialBase();
  }
  return _database;
}
//criando tabela
Future<Database> initialBase()async{
  Directory dir = await getApplicationDocumentsDirectory();
  String path = dir.path + 'dbTransactions.db';
  var base = await openDatabase(path,version: 1,onCreate: _createTable);
  return base;
}
 
_createTable(Database db , int versao)async{
await db.execute('CREATE TABLE $nametable('
'$id INTEGER PRIMARY KEY AUTOINCREMENT,'
   '$nameTransaction TEXT,'
        '$date DATA,'
        '$dueDate DATA,'
        '$typeTransaction TEXT,'
        '$valor DOUBLE)');
}
//metodo inserir (transação)
 Future<int> insertTransaction(TransactionModel  transacao) async {
    Database? db = await database;
    var result = await db!.insert(nametable, transacao.toMap());
    //ConflictAlgorithm.replace ;
    return result;
  }
//metodo busca todas transações
    Future <List<Map<String,Object?>>>listTransactions() async {
    Database? db = await database;
    String sql = "SELECT * FROM $nametable";
    List<Map<String, Object?>> list = await db!.rawQuery(sql);

    return list;
  }
    // apaga transição no banco
 Future <int>clearTransaction(int id) async {
    Database? db = await database;
   int result= await db!.delete( nametable, where: 'id = ?', whereArgs: [id], );
    return result;
    // apaga transição no banco
/*  Future updateTransaction(id) async {
    Database? db = await database;
    await db!.update(nametable, id);
 } */



}}