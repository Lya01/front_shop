import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/CircularIconButton.dart';
import 'package:front_shop/UI/widgets/ProductCard.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/CurrentCustomer.dart';
import 'package:front_shop/model/objects/Customer.dart';
import 'package:front_shop/model/objects/ProdottoInCart.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();


}

class _CartState extends State<Cart> {
  String email = CurrentCustomer.customer.email;
  List<ProdottoInCart> _products = CurrentCustomer.getProducts();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            top(),
            bottom(),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            print(_products[index].prodotti.toString());
            return ProductCard(
              product: _products[index].prodotti,
              operazione: "-",
            );
          },
        ),
      ),
    );
  }

  Widget bottom() {
    return CircularIconButton(
      icon: Icons.euro,
      onPressed: () {
        _purchase();
      },
    );
  }

  void _purchase() {
    print("Inizia vendita dei prodotti");
    List<ProdottoInCart> products = CurrentCustomer.getProducts();
    /*for(CarrelloProduct cp in products){
      Product p = cp.product;
      print("Vendita prodotto "+p.toString()+" con quantita "+cp.quantita.toString());*/
    Customer u = CurrentCustomer.getCustomer();
    Model.sharedInstance.compraProdotto(u.email, products).then((result) async {
      print("Vendita " + result.toString());
      for (ProdottoInCart cp in products) {
        await Model.sharedInstance.deleteProduct(email, cp.prodotti);
      }
      print("Fine del for");
      Model.sharedInstance.getProduct(email).then((result) {
        print("Rimozione dopo acquisto" + result.toString());
        CurrentCustomer.setProducts(result);
      });
      Model.sharedInstance.getPurchases(email).then((result) {
        CurrentCustomer.setPurchases(result);
      });
    });
  }
}
