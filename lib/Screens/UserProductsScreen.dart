import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Products.dart';
import '../Widgets/AppDrawer.dart';
import '../Widgets/UserProductItem.dart';
import '../Widgets/AppLogoName.dart';
import 'EditProductScreen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(firstName: 'Your', lastName: 'Products'),
        actions: [TextButton(child: Text('Add', style: Theme.of(context).textTheme.bodyText1), onPressed: () => Navigator.pushNamed(context, EditProductScreen.routeName))],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (_, index) => Column(
            children: [
              UserProductItem(productsData.items[index].id, productsData.items[index].title, productsData.items[index].imgUrl),
              Divider(),
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
