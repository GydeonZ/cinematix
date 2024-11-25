import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts/models/cart_model.dart';
import 'package:uts/models/fnb_model.dart';
import 'package:uts/services/services.dart';

class FoodAndDrinks extends ChangeNotifier {
  bool isLoading = true;
  List<FoodnDrinks> fnbList = [];

  void getFNB() async {
    isLoading = true;
    fnbList = await ApiServices().fetchfnb();
    isLoading = false;
    notifyListeners();
  }

  String formattedPrice (price)=> NumberFormat.currency(
    locale: 'id_ID', // This sets the currency format for Indonesian Rupiah
    symbol: 'Rp. ', // Currency symbol
    decimalDigits: 0, // Number of decimal places
  ).format(int.parse(price));
}

class GetCartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  void addItemToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void clearSelectedItems(item) {
    _cartItems.clear();
    notifyListeners();
  }
}