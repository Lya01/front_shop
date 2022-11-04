import 'package:front_shop/model/objects/Order.dart';

class OrderItem{
  int id;
  String imageUrl;
  double unitPrice;
  int quantity;
  int productId;
  Order order;



  OrderItem({required this.id, required this.imageUrl, required this.unitPrice, required this.quantity, required this.productId, required this.order});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      imageUrl: json['imageUrl'],
      unitPrice: json['unitPrice'],
      quantity: json['quantity'],
      productId: json['productId'],
      order: json['order']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'imageUrl': imageUrl,
    'unitPrice': unitPrice,
    'quantity': quantity,
    'productId':productId,
    'order':order
  };


}