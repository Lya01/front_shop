import 'package:front_shop/model/objects/Prodotto.dart';
import 'package:front_shop/model/objects/Purchase.dart';

class ProdottoInPurchase {
  int id;
  int quantita;
  Prodotto prodotti;
  Purchase purchase;



  ProdottoInPurchase({required this.id,required this.quantita,required this.prodotti, required this.purchase});

  factory ProdottoInPurchase.fromJson(Map<String, dynamic> json) {
    return ProdottoInPurchase(
        id: json['id'],
        quantita: json['quantita'],
        prodotti: json['prodotti'],
        purchase: json['purchase']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'quantita': quantita,
    'prodotti': prodotti,
    'purchase': purchase
  };

}