import 'package:front_shop/model/objects/ProdottoInCart.dart';
import 'package:front_shop/model/objects/ProdottoInPurchase.dart';

import 'Customer.dart';

class CurrentCustomer{
  static late Customer customer;
  static List<ProdottoInCart> carrelloProduct=<ProdottoInCart>[];
  static List<ProdottoInPurchase> purchases=<ProdottoInPurchase>[];
  static void setCustomer(Customer u){ customer=u; }
  static Customer getCustomer(){ return customer;}
  static void addCarrelloProduct(ProdottoInCart product){
    carrelloProduct.add(product);
  }
  static void setProducts(List<ProdottoInCart> p){
    carrelloProduct=p;
  }
  static List<ProdottoInCart> getProducts(){
    return carrelloProduct;
  }
  static void removeCarrelloProduct(ProdottoInCart product){
    carrelloProduct.remove(product);
  }
  static bool contains(ProdottoInCart product){
    for(ProdottoInCart c in carrelloProduct){
      if(c.id==product.id)
        return true;
    }
    return false;
  }

  static List<ProdottoInPurchase> getPurchases(){
    return purchases;
  }
  static void setPurchases(List<ProdottoInPurchase> p){
    purchases=p;
  }


/*
  static void clearProducts(){ carrelloProduct= null; }
  static void claerCustomer(){ customer= null; }*/

}