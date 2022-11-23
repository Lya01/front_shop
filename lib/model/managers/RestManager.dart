

import 'dart:convert';
import 'dart:io';

import 'package:front_shop/model/support/Constants.dart';
import 'package:front_shop/model/support/ErrorListener.dart';
import 'package:http/http.dart' as http;

enum TypeHeader {
  json,
  urlencoded
}


class RestManager {
   ErrorListener? delegate;
  String? token;


  Future<String> _makeRequest(String serverAddress, String servicePath, String method, TypeHeader type, {Map<String, String>? value, dynamic body}) async {

print("uri: ");
    Uri uri = Uri.http(serverAddress, servicePath, value); //crea un arichista http da mandare al back
    print(uri);
    var response;
    bool errorOccurred = false;
    while ( true ) {
      try {
        //var response;
    //    print("response: "+response.toString());
        // setting content type
        String contentType="application/json;charset=utf-8";
        dynamic formattedBody;
        if ( type == TypeHeader.json ) {
          contentType = "application/json;charset=utf-8";
          formattedBody = json.encode(body);
        }
        else if ( type == TypeHeader.urlencoded ) {
          contentType = "application/x-www-form-urlencoded";
          formattedBody = body.keys.map((key) => "$key=${body[key]}").join("&");
        }
        // setting headers
        Map<String, String> headers = Map();
        headers[HttpHeaders.contentTypeHeader] = contentType;
        //print("fine formattazione1");

        //token="";
       if ( token != null ) {
         // print("formattazione 1.2");
          headers[HttpHeaders.authorizationHeader] = 'bearer $token';
          //print("fine formattazione2");
        }
        //making request
        print("sono prima dello switch");
        switch ( method ) {
          case "post":
            print("Caso post");
            response = await http.post(
              uri,
              headers: headers,
              body: formattedBody,
            );
            print("response:");
            print(response.body.toString());
            break;

          case "get":
            //print("CASO GET");
            //print(headers.toString());
            response = await http.get(
              uri,//qui viene invocato l'uri, su viene creato
              headers: headers,
            );
            //print(response.toString());
            break;

          case "put":
            print("CASO Put");
            response = await http.put(
              uri,
              headers: headers,
            );
            print(response);
            break;
          case "delete":
            response = await http.delete(
              uri,
              headers: headers,
            );
            break;
        }
        if ( delegate != null && errorOccurred ) {
          delegate!.errorNetworkGone();
          errorOccurred = false;
        }
        return response.body;
      } catch(err) {
        if ( delegate != null && !errorOccurred ) {
          delegate!.errorNetworkOccurred(Constants.MESSAGE_CONNECTION_ERROR);
          errorOccurred = true;
        }
        print(response.toString());
        print("sono nel catch di rest");
        await Future.delayed(const Duration(seconds: 5), () => null); // not the best solution
      }
    }
  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value, {TypeHeader type = TypeHeader.json}) async {
    print("MakePostRequest");
    print(value.toString());//mi stampa solo a b e non c d pure
    return _makeRequest(serverAddress, servicePath, "post", type, body: value);
  }


   /*Future<String> makePostRequest(String serverAddress, String servicePath, dynamic value, {TypeHeader type = TypeHeader.json}) async {
   print("Make POstRequest");
   print("parametri:");
   print(serverAddress);
   print(servicePath);
   print(value);
   print(type);
   var url=Uri.http(serverAddress,servicePath,value);
   print(url);
   var headers=<String,String>{'Content-Type':'application/json; charset=UTF-8',};
   var response=await http.post(url,body: value);
   print(response.body.toString());
   return response.body.toString();
   }*/

  Future<String> makeGetRequest(String serverAddress, String servicePath,  Map<String, String> value) async {
    return _makeRequest(serverAddress, servicePath, "get", TypeHeader.json, value: value);
  }

   Future<String> makePostRequest2(String serverAddress, String servicePath, {dynamic body,Map<String, String>? params, TypeHeader type = TypeHeader.json}) async {
     print("makePostRequestCart");
     //print("body: "+body.toString());
     return _makeRequest(serverAddress, servicePath, "post", type, body: body,value: params);
   }

  Future<String> makePutRequest(String serverAddress, String servicePath,dynamic value, dynamic body /*Map<String, String>? value,TypeHeader? type*/) async {
    print("makePutRequest");
    print("value:");
    print(value.toString());
    print("body: ");
    print(body.toString());
    return _makeRequest(serverAddress, servicePath, "put", TypeHeader.json,value:value,body:body);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, Map<String, String> value) async {
    return _makeRequest(serverAddress, servicePath, "delete", TypeHeader.json, value: value);
  }


}
