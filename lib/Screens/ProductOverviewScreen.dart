import 'package:flutter/material.dart';
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
            icon: Icon(Icons.filter_list),
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
          Badge(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
            ),
            value: '0',
          )
        ],
      ),
      drawer: Drawer(),
      body: ProductList(_showOnlyFavorites),
    );
  }
}
