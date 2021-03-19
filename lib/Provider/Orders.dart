import 'package:flutter/foundation.dart';

import 'Cart.dart' show CartItem;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders extends ChangeNotifier {
  List<OrderItem> _items = <OrderItem>[];

  List<OrderItem> get items => [..._items];

  void addOrder(List<CartItem> products, double total) {
    _items.insert(
      0,
      OrderItem(
        id: 'Order-${DateTime.now().toIso8601String()}',
        amount: total,
        products: products,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
