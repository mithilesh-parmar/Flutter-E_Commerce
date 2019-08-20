import 'package:e_commerce/model/woocommerce_product.dart';
import 'package:flutter/foundation.dart';

class CartState extends ChangeNotifier {
  // ADD ORDER PROPERTIES

  List<Product> _cartProducts;

  double _totalAmount = 0.0;
  double deliveryCharge = 200;
  double _payableAmount = 0;
  int cartProducts = 0;

  CartState() {
    _cartProducts = List();
  }

  addProduct(Product product) {
    if (_cartProducts.contains(product)) {}
    _cartProducts.add(product);
    _totalAmount += double.parse(product.price);
    debugPrint('${product.name} added');
    cartProducts = _cartProducts.length;
    _updatePayableAmount();
    notifyListeners();
  }

  List<Product> getCartProducts() => _cartProducts;

  _updatePayableAmount() {
    _payableAmount = _totalAmount + deliveryCharge;
  }

  double getPayableAmount() => _payableAmount;

  double getTotalAmount() => _totalAmount;

  removeProduct(Product product) {
    _cartProducts.remove(product);
    cartProducts = _cartProducts.length;
    _totalAmount -= double.parse(product.price);
    _updatePayableAmount();
    notifyListeners();
  }
}
