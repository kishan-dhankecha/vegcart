import 'package:flutter/material.dart';
import '../Widgets/AppLogoName.dart';
import '../Widgets/badge.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: AppLogoName(),
        actions: [
          Badge(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {},
              ),
              value: '0')
        ],
      ),
      body: Center(
        child: Text('Let\'s get Started!'),
      ),
    );
  }
}
