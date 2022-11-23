import 'package:front_shop/model/objects/Customer.dart';

class Purchase {
  int id;
  Customer customer;




  Purchase({required this.id,required this.customer});

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
        id: json['id'],
        customer: Customer.fromJson(json['customer'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'customer': customer
  };

}