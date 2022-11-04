

import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/CircularIconButton.dart';
import 'package:front_shop/UI/widgets/InputField.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/Customer.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _adding = false;
  Customer? _justAddedUser;

  TextEditingController _emailFiledController = TextEditingController();
  TextEditingController _passwordFiledController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "login" + "!",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.deepOrangeAccent.shade400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [

                  InputField(
                    labelText: "email",
                    controller: _emailFiledController,
                  ),
                  InputField(
                    labelText: "password",
                    controller: _passwordFiledController,
                  ),
                  CircularIconButton(
                    icon: Icons.person_rounded,
                    onPressed: () {
                      _login();
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: _adding ?
                      CircularProgressIndicator() :
                      _justAddedUser != null ?
                      Text(
                        "loggato",
                      ) :
                      SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    /* Customer user = Customer(

      firstName: _firstNameFiledController.text,
      lastName: _lastNameFiledController.text,
      email: _emailFiledController.text,
      password: _passwordFiledController.text,

    );*/

    Customer? c = await Model.sharedInstance.login({
      "email": _emailFiledController.text,
      "password": _passwordFiledController.text
    });
  }
}