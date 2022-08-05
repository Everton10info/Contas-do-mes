import 'package:contas_do_mes/repositorys/repository_coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewModelCoins extends ChangeNotifier {
  final RepositoryCoins _repositporyCoins;

  ViewModelCoins(this._repositporyCoins);

  TextEditingController value = TextEditingController();
  var coinsValueReturn = 0.0;

  getCoins<String>(index) async {
    coinsValueReturn = 0.0;
    var resultRequestWeb = await _repositporyCoins.getDataWeb(_repositporyCoins.coins[index]);
    var valueCoins = double.parse(resultRequestWeb);
    var valueDouble = double.tryParse(value.text);
    var result = valueCoins * valueDouble!;

    resultRequestWeb = '';
    coinsValueReturn = result;
    notifyListeners();
    return coinsValueReturn;
  }
}
