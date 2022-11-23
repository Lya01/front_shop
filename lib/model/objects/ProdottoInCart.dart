
import 'package:front_shop/model/objects/Cart.dart';
import 'package:front_shop/model/objects/Prodotto.dart';

class ProdottoInCart {
  int id;
  int disponibilita;
  Cart cart;
  Prodotto prodotti;



  ProdottoInCart({ required this.id,required this.disponibilita,required this.cart, required this.prodotti});

  factory ProdottoInCart.fromJson(Map<String, dynamic> json) {
    print("json");
    print(json);
    return ProdottoInCart(
      id: json['id'],
      disponibilita: json['disponibilita'],
      cart: Cart.fromJson( json['cart'] ),
      prodotti: Prodotto.fromJson( json['prodotti'] ),
    );
  }


  Map<String, dynamic> toJson() => {
    'id': id,
    'disponibilita': disponibilita,
    'cart': cart,
    'prodotti': prodotti,
  };

}