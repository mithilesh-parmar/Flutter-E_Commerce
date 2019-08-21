import 'package:e_commerce/model/woocommerce_product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:e_commerce/util/constants.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/model/woocommerce_category.dart' as ProductCategory;

class Repository {
  static List<Product> products = new List();
  List<Product> relatedProducts = new List();

  static List<ProductCategory.Category> categories = new List();

  static final URL_CLOUD =
      'https://mastigophoran-miner.000webhostapp.com/wp-json/wc/v3/';
  static var auth_cloud =
      "Basic Y2tfZmM3NWViMjA3ZTllNDhlY2M4NTJmYmZkZDk0NjFmMTEyZWY5ZDg2MDpjc185OTgzMjRjNzA5MWRmOWRkMjU2MTE3ZGNmNjEwNTg2NWYxNTVkZTc4";
  static final CONSUMER_KEY_CLOUD =
      'ck_fc75eb207e9e48ecc852fbfdd9461f112ef9d860';
  static final CONSUMER_SECRET_CLOUD =
      'cs_998324c7091df9dd256117dcf6105865f155de78';

//  Future<List<Product>> getProducts() async {
//    if (products.length > 0) {
//      return products;
//    }
//    print('contacting servers');
//    Response r = await get('${URL_CLOUD}products',
//        headers: {'Authorization': auth_cloud});
//    if (r.statusCode != 200) return null;
//    products = (json.decode(r.body) as List)
//        .map((value) => Product.fromJSON(value))
//        .toList();
//    return products;
//  }

  fetchProductsData() async =>
      await get('${URL_CLOUD}products', headers: {'Authorization': auth_cloud});

  fetchCategoryData() async => await get('${URL_CLOUD}products/categories',
      headers: {'Authorization': auth_cloud});

  fetchProductsForCategory(String categoryId) async =>
      await get('${URL_CLOUD}products?category=$categoryId',
          headers: {'Authorization': auth_cloud});

  Future<List<Product>> getProductForCategory(String categoryId) async {
    List<Product> categoryProducts = List();
    debugPrint('Fetching category products for id : $categoryId');
    Response r = await get('${URL_CLOUD}products?category=$categoryId',
        headers: {'Authorization': auth_cloud});
    debugPrint('${r.statusCode}');
    categoryProducts = (json.decode(r.body) as List)
        .map((value) => Product.fromJSON(value))
        .toList();
    return categoryProducts;
  }

//  Future<List<ProductCategory.Category>> getCategories() async {
//    print('fetching categories.....');
//    if (categories.length > 0) {
//      print('returning cached categories');
//      return categories;
//    }
//    print('requesting cloud');
//    Response r = await get('${URL_CLOUD}products/categories',
//        headers: {'Authorization': auth_cloud});
//
//    print(r.statusCode);
//    categories = (json.decode(r.body) as List)
//        .map((value) => ProductCategory.Category.fromJSON(value))
//        .toList();
//    return categories;
//  }

  Future<List<Product>> getRelatedProductsFor(Product product) async {
    List relatedIds = product.relatedIds;
    if (relatedProducts.length > 0) return relatedProducts;
    for (int id in relatedIds) {
      Response r = await get('${URL_CLOUD}products/$id',
          headers: {'Authorization': auth_cloud});
      debugPrint('${r.statusCode}');
      relatedProducts.add(Product.fromJSON(json.decode(r.body)));
    }

    return relatedProducts;
  }
}
