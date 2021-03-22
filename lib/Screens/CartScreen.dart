import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/AppLogoName.dart';
import '../Widgets/CartItem.dart';
import '../Provider/Orders.dart';
import '../Provider/Cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(
          firstName: 'Your',
          lastName: 'Cart',
        ),
      ),
      body: cart.itemCount == 0
          ? Center(
              child: Text(
                'Your cart is Empty\nTry adding some.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          'Total:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Spacer(),
                        Chip(
                          label: Text(
                            '₹${cart.totalAmount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(
                              cart.items.values.toList(),
                              cart.totalAmount,
                            );
                            cart.clear();
                          },
                          child: const Text('Order now'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cart.itemCount,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItem(
                        id: cart.items.values.toList()[index].id,
                        productId: cart.items.keys.toList()[index],
                        title: cart.items.values.toList()[index].title,
                        quantity: cart.items.values.toList()[index].quantity,
                        price: cart.items.values.toList()[index].price,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
