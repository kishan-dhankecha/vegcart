import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegcart/Widgets/AppLogoName.dart';

import '../Widgets/AppDrawer.dart';
import '../Widgets/OrderItem.dart';
import '../Provider/Orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(
          firstName: 'Past',
          lastName: 'Orders',
        ),
      ),
      drawer: AppDrawer(),
      body: orders.items.length == 0
          ? Center(
              child: Text(
                'No Orders available.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: orders.items.length,
              itemBuilder: (_, index) {
                return OrderItem(orders.items[index]);
              },
            ),
    );
  }
}
