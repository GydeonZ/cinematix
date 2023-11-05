
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:praktikum/models/cart_model.dart';

class CalculatePrice extends ChangeNotifier {
  double calculateTotalPrice(List<CartItem> cartItems) {
    return cartItems.fold(0, (sum, item) {
      return sum + (item.quantity * double.parse(item.itemPrice));
    });
  }

  String formatTotalPrice(double totalPrice) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(totalPrice);
  }
}