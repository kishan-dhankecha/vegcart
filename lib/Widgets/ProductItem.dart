import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Cart.dart';
import '../Provider/Products.dart';
import '../Screens/ProductDetailScreen.dart';
import 'BlurInImage.dart';
import 'StarRating.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Container(
              height: (160.00),
              width: double.infinity,
              child: BlurInImage(product.imgUrl),
            ),
          ),
          Divider(
            thickness: 2,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    StarRating(
                      rating: product.rating,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '₹${product.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headline6,
                        children: [
                          TextSpan(
                            text: '/kg.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Consumer<Product>(
                      builder: (_, product, __) => IconButton(
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        onPressed: () {
                          product.toggleFavorite();
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cart.addItem(
                          title: product.title,
                          productId: product.id,
                          price: product.price,
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('1 ${product.title} added to cart.'),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'UNDO',
                              textColor:
                                  Theme.of(context).colorScheme.secondary,
                              onPressed: () {
                                cart.removeSingleItem(product.id);
                              },
                            ),
                          ),
                        );
                      },
                      child: const Text('ADD TO CART'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
