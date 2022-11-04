import 'package:front_shop/model/objects/Address.dart';
import 'package:front_shop/model/objects/Customer.dart';
import 'package:front_shop/model/objects/OrderItem.dart';

class Order {
  int id;
  String orderTrackingNumber;
  int totalQuantity;
  double totalPrice;
  String status;
  DateTime dateCreated;
  DateTime lastUpdated;
  Set<OrderItem> orderItems;
  Customer customer;
  Address shippingAddress;
  Address billingAddress;


  Order(
      {required this.id, required this.orderTrackingNumber, required this.totalQuantity, required this.totalPrice, required this.status, required this.dateCreated, required this.lastUpdated, required this.orderItems, required this.customer, required this.shippingAddress, required this.billingAddress});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderTrackingNumber: json['orderTrackingNumber'],
      totalQuantity: json['totalQuantity'],
      totalPrice: json['totalPrice'],
      status: json['status'],
      dateCreated: json['dateCreated'],
      lastUpdated: json['lastUpdated'],
      orderItems: json['orderItems'],
      customer: json['customer'],
      shippingAddress: json['shippingAddress'],
      billingAddress: json['billingAddress'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'orderTrackingNumber': orderTrackingNumber,
        'totalQuantity': totalQuantity,
        'totalPrice': totalPrice,
        'status': status,
        'dateCreated': dateCreated,
        'lastUpdated': lastUpdated,
        'orderItems': orderItems,
        'customer': customer,
        'shippingAddress': shippingAddress,
        'billingAddress': billingAddress
      };


}