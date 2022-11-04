
import 'package:flutter/material.dart';

import 'package:front_shop/UI/pages/Layout.dart';
import 'package:front_shop/model/support/Constants.dart';


class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.APP_NAME,
      theme: ThemeData(
        primaryColor: Colors.teal.shade700,
        backgroundColor: Colors.deepOrange.shade400,
        buttonColor: Colors.deepPurple.shade900,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.amberAccent,
        backgroundColor: Colors.black,
        canvasColor: Colors.black,
        buttonColor: Colors.amber,
        cardColor: Colors.grey[800],
      ),
      home: Layout(title: Constants.APP_NAME),
    );
  }


}
