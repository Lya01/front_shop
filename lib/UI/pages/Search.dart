
import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/CircularIconButton.dart';
import 'package:front_shop/UI/widgets/InputField.dart';
import 'package:front_shop/UI/widgets/ProductCard.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/Prodotto.dart';


class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool _searching = false;
  List<Prodotto>? _products;

  TextEditingController _searchFiledController = TextEditingController();


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

  Widget top() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Flexible(
            child: InputField(
              labelText: "search",
              controller: _searchFiledController,
              onSubmit: (value) {
                _search();
              },
            ),
          ),
          CircularIconButton(
            icon: Icons.search_rounded,
            onPressed: () {
              _search();
            },
          ),
        ],
      ),
    );
  }

  Widget bottom() {
    return  !_searching ?
              _products == null ?
                SizedBox.shrink() :
                _products!.length == 0 ?
                  noResults() :
                  yesResults() :
              CircularProgressIndicator();
  }

  Widget noResults() {
    return Text("no_results" + "!");
  }

  Widget yesResults() {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: _products!.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: _products![index], operazione: '+',
            );
          },
        ),
      ),
    );
  }

  void _search() {
    setState(() {
      _searching = true;
      _products = null;
    });
    Model.sharedInstance.searchProduct(_searchFiledController.text).then((result) {
      setState(() {
        _searching = false;
        _products = result;
      });
    });
  }


}
