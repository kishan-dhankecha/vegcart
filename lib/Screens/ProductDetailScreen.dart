import 'package:flutter/material.dart';
import '../DUMMY_DATA.dart';
import '../Modals/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    Product product = DUMMY_DATA.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
    );
  }
}
