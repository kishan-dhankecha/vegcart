import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Products.dart';

import 'ProductItem.dart';

class ProductList extends StatelessWidget {
  final bool showFavs;

  const ProductList(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favorites : productsData.items;
    if (showFavs && products.length == 0)
      return Center(
        child: Text(
          'No Favorites available\nTry adding some.',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      );
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider<Product>.value(
          value: products[i],
          child: ProductItem(),
        );
      },
    );
  }
}
