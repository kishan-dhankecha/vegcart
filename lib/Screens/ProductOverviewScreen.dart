import 'package:flutter/material.dart';
import '../Widgets/ProductList.dart';
import '../Widgets/CustomAppBar.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      drawer: Drawer(),
      body: ProductList(),
    );
  }
}
