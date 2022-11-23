import 'dart:async';
import 'dart:convert';

import 'package:front_shop/model/managers/RestManager.dart';
import 'package:front_shop/model/objects/Customer.dart';
import 'package:front_shop/model/objects/Prodotto.dart';
import 'package:front_shop/model/objects/ProdottoInCart.dart';
import 'package:front_shop/model/objects/ProdottoInPurchase.dart';
import 'package:front_shop/model/support/Constants.dart';



class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();

  Future<List<Prodotto>?> searchProduct(String name) async {
    Map<String, String> params = Map();
    params["nome"] = name;
    try {
      return List<Prodotto>.from(json.decode(await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_PRODUCTS,
          params)).map((i) => Prodotto.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }

  Future<ProdottoInCart> insertProduct(String email, Prodotto product) async {
    print("parametri di insert product:"); print(email); print(" "); print(product.toString());

    print("Metodo insert product to cart");
    String rawResult = await _restManager.makePutRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_PRODUCT_CART, {"email":email}, product.toJson());
    print("Metodo1 " + rawResult.toString());
    return ProdottoInCart.fromJson(jsonDecode(rawResult));
  }


  Future<List<ProdottoInCart>> getProduct(String email) async {
    print("sono in get product");
    return List<ProdottoInCart>.from(json.decode(
        await _restManager.makeGetRequest(
            Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_GET_PRODUCT_CART,
            {"email": email})).map((i) => ProdottoInCart.fromJson(i)).toList());
  }

/*
  Future<Customer?> addUser(Customer user) async {
    try {
      String rawResult = await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_USER, user);
      if ( rawResult.contains(Constants.RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS) ) {
        return null; // not the best solution
      }
      else {
        return Customer.fromJson(jsonDecode(rawResult));
      }
    }
    catch (e) {
      return null; // not the best solution
    }
  }*/

  Future<Customer?> login(Map<String, String> mp) async {
    print("siamo in login");
    print(mp);
    Customer c = Customer.fromJson(json.decode(
        await _restManager.makeGetRequest(
            Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LOGIN, mp)));
    print("siamo in model");
    print(c);
    return c;
  }

  Future<ProdottoInCart> deleteProduct(String email, Prodotto product) async {
    String rawResult = await _restManager.makePutRequest(
        Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_REMOVE_PRODUCT_CART,
        {"email": email}, product);
    return ProdottoInCart.fromJson(jsonDecode(rawResult));
  }

  Future<List<ProdottoInPurchase>> compraProdotto(String email,
      List<ProdottoInCart> products) async {
      print("Stampa");
      List<ProdottoInPurchase> purchases = [];
      for (ProdottoInCart cp in products) {
        print(cp);
        Map<String, String> params = Map();
        params["email"] = email;
        params["disponibilita"] = cp.disponibilita.toString();
        String rawResult = await _restManager.makePutRequest(
            Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_PURCHASE_PRODUCT, params, cp.prodotti);
        print("termina");

        ProdottoInPurchase pp = ProdottoInPurchase.fromJson(
            jsonDecode(rawResult));
        print("Purchase " + pp.toString());
        purchases.add(pp);
      }
      return purchases;
    }


    Future<Customer?> registration(Customer user) async {
      try {
        print("richiamo registration in model");
        String rawResult = await _restManager.makePostRequest(
            Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_REGISTRATION,
            user);
        print(rawResult);
        /*if (rawResult.contains(
          Constants.RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS)) {
        return null; // not the best solution
      }
      else {*/
        return Customer.fromJson(jsonDecode(rawResult));
        //}
      } catch (e) {
        return null;
      }
    }

  Future<List<ProdottoInPurchase>> getPurchases(String email) async{

    return List<ProdottoInPurchase>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_GET_PURCHASES, {"email":email})).map((i) => ProdottoInPurchase.fromJson(i)).toList());

  }
  }
