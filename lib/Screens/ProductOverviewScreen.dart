import 'package:flutter/material.dart';
import 'package:vegcart/Widgets/ProductItem.dart';
import '../DUMMY_DATA.dart';
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
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        physics: BouncingScrollPhysics(),
        itemCount: DUMMY_DATA.length,
        itemBuilder: (ctx, index) {
          return ProductItem(index);
        },
      ),
    );
  }
}
