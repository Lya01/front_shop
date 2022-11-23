import 'Customer.dart';

class Cart{
  int id;
  Customer customer;

  Cart({required this.id,required this.customer});

  factory Cart.fromJson(Map<String,dynamic> json){
    return Cart(
      id: json['id'],
      customer: Customer.fromJson( json['customer'] ),
    );
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'customer':customer,
  };

  @override
  String toString(){
    return id.toString();
  }
}