import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegcart/Provider/Cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      {this.id, this.productId, this.price, this.quantity, this.title});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeAllItem(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.remove_shopping_cart,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    '₹${price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              radius: 25.0,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              'Total: ₹${(quantity * price).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: Text(
              '${quantity}x',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
