import 'package:flutter/material.dart';
import 'Screens/ProductDetailScreen.dart';
import 'Screens/ProductOverviewScreen.dart';

import 'theme.dart';

void main() => runApp(VegCartApp());

class VegCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VegCart',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      home: ProductOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
