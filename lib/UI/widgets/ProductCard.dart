
import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/CircularIconButton.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/CurrentCustomer.dart';
import 'package:front_shop/model/objects/Customer.dart';
import 'package:front_shop/model/objects/Prodotto.dart';


class ProductCard extends StatefulWidget {
  final Prodotto product;
  String operazione = "+";

  @override
_ProductCardState createState() => _ProductCardState( this.product, this.operazione);

  ProductCard({Key? key, required this.product, required String operazione}) : super(key: key);
}
class _ProductCardState extends State<ProductCard> {
  final Prodotto product;
  String operazione = "+";


  _ProductCardState(this.product, this.operazione);



  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0), //rotondità
      ),
      child: Padding(
        padding: EdgeInsets.all(50), //questo è per la grandezza
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 200,
              width: 200,
            ),
            //qui vanno agguiunti i dettagli del prodotto
            Text(
              product.nome,
              style: TextStyle(
                fontSize: 20,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text(
              product.descrizione,
              style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
            Text(
                "€ " + product.prezzo.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                )
            ),
            CircularIconButton(
              icon: getIcon(),
              onPressed: () { //metodo che eseguiamo quando premiamo il bottone
                if (operazione == '+'){
                  print("sono in onPressed di productCard");
                  print(product);
                  _addProduct(product);}
                else
                  _removeProduct();
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData getIcon(){
    if(operazione=='+'){
      return Icons.add_shopping_cart;
    }
    return Icons.remove_shopping_cart;
  }

  void _addProduct(Prodotto product){
    print("addProduct, product: ");
    Customer currUser = CurrentCustomer.getCustomer();
    Model.sharedInstance.insertProduct(currUser.email, product).then((result) {
      setState(() {
        print("Risultato add product in cart"+result.toString());
        print("Contenuto ricevuto " +CurrentCustomer.getProducts().toString());
        Model.sharedInstance.getProduct(currUser.email).then((result) {
          print("Contenuto carrelllo dopo AGGIUNTA " + result.toString() + " " +
              result.length.toString());
          CurrentCustomer.setProducts(result);
         // print("D "+result[2].product.prodotti.toString());
        });
      });
    });
  }

  void _removeProduct(){
    Customer currUser = CurrentCustomer.getCustomer();
    Model.sharedInstance.deleteProduct(currUser.email, product).then((result) {
      setState(() {
        Model.sharedInstance.getProduct(currUser.email).then((result) {
          print("Contenuto carrelllo dopo AGGIUNTA " + result.toString() + " " +
              result.length.toString());
          CurrentCustomer.setProducts(result);
        });
      });
    });
  }
}
