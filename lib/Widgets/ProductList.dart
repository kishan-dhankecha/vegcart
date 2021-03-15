import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Product.dart';
import '../Provider/Products.dart';

import 'ProductItem.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
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
