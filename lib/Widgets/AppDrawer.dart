import 'package:flutter/material.dart';

import '../Screens/OrdersScreen.dart';
import '../Screens/UserProductsScreen.dart';
import 'AppLogoName.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogoName(),
                  Text(
                    'v1.0.0',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap: () {
                Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, UserProductsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
