import 'package:front_shop/model/objects/Order.dart';

class Customer {
  int? id;
  String firstName;
  String lastName;
  String email;
  String? password;
  Set<Order>? orders;



  Customer({ this.id,  required this.firstName, required this.lastName, required this.email,this.password, this.orders});


  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      orders: json['orders']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'orders':orders
  };

  @override
  String toString() {
    return firstName + " " + lastName;
  }


}