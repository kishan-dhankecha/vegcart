import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Provider/Cart.dart';
import 'Provider/Orders.dart';
import 'Provider/Products.dart';
import 'Screens/EditProductScreen.dart';
import 'Screens/UserProductsScreen.dart';
import 'Screens/CartScreen.dart';
import 'Screens/OrdersScreen.dart';
import 'Screens/ProductDetailScreen.dart';
import 'Screens/ProductOverviewScreen.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(VegCartApp());
}

class VegCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'VegCart',
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        debugShowCheckedModeBanner: false,
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen(),
          OrdersScreen.routeName: (_) => OrdersScreen(),
          UserProductsScreen.routeName: (_) => UserProductsScreen(),
          EditProductScreen.routeNAme: (_) => EditProductScreen(),
        },
      ),
    );
  }
}
