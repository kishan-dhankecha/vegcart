import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Cart.dart';
import '../Widgets/badge.dart';
import '../Widgets/AppLogoName.dart';
import '../Widgets/ProductList.dart';

enum Filter { All, Fav }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppLogoName(),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_alt),
            onSelected: (Filter val) {
              setState(() {
                if (val == Filter.Fav) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show all'),
                value: Filter.All,
              ),
              PopupMenuItem(
                child: Text('Only favorites'),
                value: Filter.Fav,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, Widget child) {
              return Badge(
                child: child,
                value: '${cart.itemCount}',
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: ProductList(_showOnlyFavorites),
    );
  }
}
