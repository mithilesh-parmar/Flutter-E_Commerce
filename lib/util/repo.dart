import 'package:e_commerce/model/woocommerce_product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:e_commerce/util/constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


class Repository {
  static List<Product> products = new List();

  Future<List<Product>> getProducts() async {

    if(products.length > 0){
      return products;
    }
    print('contacting servers');
    Response r = await get('${Constants.URL_CLOUD}',
        headers: {'Authorization': Constants.auth_cloud});
    debugPrint('${r.statusCode}');
    products = (json.decode(r.body) as List)
        .map((value) => Product.fromJSON(value))
        .toList();
    return products;
  }
}
