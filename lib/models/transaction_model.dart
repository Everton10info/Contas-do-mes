import 'package:intl/intl.dart';

class TransactionModel {
  int? id;
  String nameTransaction;
  String? date;
  String? dueDate;
  String typeTransaction;
  double valor;

  TransactionModel({
    required this.id,
    required this.nameTransaction,
    required this.date,
    required this.dueDate,
    required this.typeTransaction,
    required this.valor,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nameTransaction': nameTransaction,
        'date': date,
        'dueDate': dueDate,
        'typeTransaction': typeTransaction,
        'valor': valor,
      };

  factory TransactionModel.fromjson(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      nameTransaction: map['nameTransaction'],
      date: map['date'],
      dueDate: map['dueDate'],
      typeTransaction: map['typeTransaction'],
      valor: map['valor'],
    );
  }
}
