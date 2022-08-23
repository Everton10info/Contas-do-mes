import 'package:contas_do_mes/repositorys/repository_coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewModelCoins extends ChangeNotifier {
  final RepositoryCoins _repositporyCoins;
  ViewModelCoins(this._repositporyCoins);

  TextEditingController value = TextEditingController();
  var resultLabel = '';
  var resultValue = '';
  bool loader = false;

  getCoins(index) async {
    loader = true;
    notifyListeners();
    var resultRequestWeb = await _repositporyCoins.getDataWeb(_repositporyCoins.coins[index]);
    if (value.text.isNotEmpty && resultRequestWeb != null) {
      var valueCoins = double.parse(resultRequestWeb.high);
      var valueDouble = double.parse(value.text);

      switch (index) {
        case 0:
          var result = valueCoins * valueDouble;
          resultValue = '${result.toStringAsFixed(2)} R\$';
          resultLabel = '${resultRequestWeb.name}: ';
          loader = false;
          notifyListeners();
          break;

        case 1:
          var result = valueCoins * valueDouble;
          resultValue = '${result.toStringAsFixed(2)} R\$';
          resultLabel = '${resultRequestWeb.name}: ';
          loader = false;
          notifyListeners();
          break;

        case 2:
          var result = valueCoins * valueDouble;
          resultValue = '${result.toStringAsFixed(2)} R\$';
          resultLabel = '${resultRequestWeb.name}: ';
          loader = false;
          notifyListeners();

          break;
      }
    } else {
      resultLabel = '';
      resultValue = '';
      loader = false;
      notifyListeners();
    }
  }
}
