class TransactionModel {
  String? id;
  String nameTransaction;
  String? date;
  String? dueDate;
  String typeTransaction;
  double valor;
  int paidOut;

  TransactionModel({
    required this.id,
    required this.nameTransaction,
    required this.date,
    required this.dueDate,
    required this.typeTransaction,
    required this.valor,
    required this.paidOut
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nameTransaction': nameTransaction,
        'date': date,
        'dueDate': dueDate,
        'typeTransaction': typeTransaction,
        'valor': valor,
        'paidOut': paidOut,
       
      };

  factory TransactionModel.fromjson(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      nameTransaction: map['nameTransaction'],
      date: map['date'],
      dueDate: map['dueDate'],
      typeTransaction: map['typeTransaction'],
      valor: map['valor'],
      paidOut: map['paidOut']
    );
  }
}
