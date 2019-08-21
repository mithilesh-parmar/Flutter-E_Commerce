import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:flutter/foundation.dart';
import 'package:e_commerce/util/repo.dart';
import 'dart:convert';

class DetailState extends ChangeNotifier {
  bool isLoading = true;
  bool isExpanded = false;

  List<Product> _products;
  Repository _repository;

  DetailState() {
    _products = List();
    _repository = Repository();
    initProducts();
  }



  List<Product> get products => _products;

  initProducts() async {
    isLoading = true;
    notifyListeners();
    if (_products.length > 0) {
      isLoading = false;
      notifyListeners();
      return _products;
    }
    var data = await _repository.fetchProductsData();
    if (data != null) {
      _products = (json.decode(data.body) as List)
          .map((value) => Product.fromJSON(value))
          .toList();
      isLoading = false;
      notifyListeners();
    }
  }
}
