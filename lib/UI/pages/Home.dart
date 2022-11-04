import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/ProductCard.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/Prodotto.dart';


class Home extends StatefulWidget {


  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
List<Prodotto>? _products;
bool _view=false;


  @override
  Widget build(BuildContext context) {
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

  Widget top(){
    _search();
    return Padding(
      padding: EdgeInsets.fromLTRB(10,10,10,10),
      child: Text("Prodotti"),
    );
  }

  void _search(){
    //List<Prodotto>? result;
    Model.sharedInstance.searchProduct("").then((result){
      setState((){
        _view=true;
        _products=result;
      });
    });
  }
  Widget bottom(){
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _products!.length,
          itemBuilder: (context,index){
            return ProductCard(
              product: _products![index],
            );
          },
        ),
      ),
    );
  }
   /* return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'welcome',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.deepOrangeAccent.shade400,
                ),
      ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Icon(
                Icons.shopping_basket_outlined,
                size: 300,
                color: Colors.deepOrangeAccent.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }*/


}
