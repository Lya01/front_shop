import 'dart:async';
import 'dart:convert';

import 'package:front_shop/model/managers/RestManager.dart';
import 'package:front_shop/model/objects/Customer.dart';
import 'package:front_shop/model/objects/Prodotto.dart';
import 'package:front_shop/model/support/Constants.dart';



class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();

  Future<List<Prodotto>?> searchProduct(String name) async {
    print("Entra in search product");
    Map<String, String> params = Map();
    params["nome"] = name;
    try { //scomponi questo per vedere se ottieni il coso giusto
      print(json.decode('[{"prova":1}]'));
      return List<Prodotto>.from(json.decode(await _restManager.makeGetRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_PRODUCTS,
          params)).map((i) => Prodotto.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      print("catch");
      return null; // not the best solution
    }
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
    Customer c = Customer.fromJson(json.decode(
        await _restManager.makeGetRequest(
            Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LOGIN, mp)));
    return c;
  }


  Future<Customer?> registration(Customer user) async {
    try {
      print("richiamo registration in model");
      String rawResult = await _restManager.makePostRequest(
          Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_REGISTRATION, user);
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
}