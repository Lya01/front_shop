
import 'package:flutter/material.dart';
import 'package:front_shop/model/objects/Prodotto.dart';


class ProductCard extends StatelessWidget {
  final Prodotto product;


  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),//rotondità
      ),
      child: Padding(
        padding: EdgeInsets.all(50), //questo è per la grandezza
        child: Column(
          children: [
            Image.asset(
              product.image,
              height:200,
              width:200,
            ),
            //qui vanno agguiunti i dettagli del prodotto
            Text(
              product.nome,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              product.descrizione,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              "€ "+product.prezzo.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              )
            )
          ],
        ),
      ),
    );
  }


}
