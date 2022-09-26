class Coins {
  String code;
  String codein;
  String name;
  String high;
  String low;
 

  Coins({
    required this.code,
    required this.codein,
    required this.name,
    required this.high,
    required this.low,
  
  });

   factory Coins.fromjson(Map<String, dynamic> map) {
    return Coins(
      code: map['code'],
      codein: map['codein'],
      name: map['name'],
      high: map['high'],
      low: map['low'],
  
    );
  }
}
