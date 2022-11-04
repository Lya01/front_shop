
import 'package:flutter/material.dart';
import 'package:front_shop/UI/widgets/CircularIconButton.dart';
import 'package:front_shop/UI/widgets/InputField.dart';
import 'package:front_shop/model/Model.dart';
import 'package:front_shop/model/objects/Customer.dart';


class UserRegistration extends StatefulWidget {
  UserRegistration({Key? key}) : super(key: key);


  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  bool _adding = false;
  Customer? _justAddedUser;

  TextEditingController _firstNameFiledController = TextEditingController();
  TextEditingController _lastNameFiledController = TextEditingController();
  TextEditingController _emailFiledController = TextEditingController();
  TextEditingController _passwordFiledController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Registration",
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: [

                  InputField(
                    labelText: "firstName",
                    controller: _firstNameFiledController,
                  ),
                  InputField(
                    labelText: "lastName",
                    controller: _lastNameFiledController,
                  ),
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
                      _register();
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: _adding ?
                      CircularProgressIndicator() : //QUIIII
                      _justAddedUser != null ?
                      Text(
                          "just added"
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

  void _register() {
    setState(() {
      _adding = true;
      _justAddedUser = null;
    });
    Customer user = Customer(

      firstName: _firstNameFiledController.text,
      lastName: _lastNameFiledController.text,
      email: _emailFiledController.text,
      password: _passwordFiledController.text,

    );
    Model.sharedInstance.registration(user).then((result) {//qui avevo messo add user
      setState(() {
        _adding = false;
        _justAddedUser = result;
      });
    });
  }


}
