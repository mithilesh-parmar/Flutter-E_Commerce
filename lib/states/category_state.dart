import 'package:e_commerce/model/woocommerce_category.dart' as WooCommerce;
import 'package:e_commerce/util/repo.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class CategoryState extends ChangeNotifier {
  bool isLoading = true;
  List<WooCommerce.Category> _categories;
  Repository _repository;

  CategoryState() {
    _categories = List();
    _repository = Repository();
    initCategories();
  }

  List<WooCommerce.Category> get categories => _categories;

  initCategories() async {
    isLoading = true;
    notifyListeners();
    if (_categories.length > 0) {
      isLoading = false;
      notifyListeners();
      return _categories;
    }
    var data = await _repository.fetchCategoryData();
    debugPrint('${data.statusCode}');
    if (data != null) {
      _categories = (json.decode(data.body) as List)
          .map((value) => WooCommerce.Category.fromJSON(value))
          .toList();
      isLoading = false;
      notifyListeners();
    }
  }
}
