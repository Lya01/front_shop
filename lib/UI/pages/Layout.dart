
import 'package:flutter/material.dart';
import 'package:front_shop/UI/pages/Home.dart';
import 'package:front_shop/UI/pages/Login.dart';
import 'package:front_shop/UI/pages/Search.dart';
import 'package:front_shop/UI/pages/UserRegistration.dart';


class Layout extends StatefulWidget {
  final String title;


  Layout({Key? key, required this.title}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState(title);
}

class _LayoutState extends State<Layout> {
  String title="shopSite";


  _LayoutState(String title) {
    this.title = title;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(text:"home", icon: Icon(Icons.home_rounded)),
              Tab(text:"search", icon: Icon(Icons.search_rounded)),
              Tab(text:"user", icon: Icon(Icons.person_rounded)),
              Tab(text:"login", icon: Icon(Icons.person_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Search(),
            UserRegistration(),
            Login()

          ],
        ),
      ),
    );
  }


}
