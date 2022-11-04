import 'package:front_shop/model/objects/Order.dart';

class Address {
  int id;
  String street;
  String city;
  String state;
  String country;
  String zipCode;
  Order order;


  Address({required this.id, required this.street, required this.city, required this.state, required this.country, required this.zipCode, required this.order});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
      order: json['order']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'street': street,
    'city': city,
    'state': state,
    'country':country,
    'zipCode':zipCode,
    'order':order
  };


}