import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments as String;

    final productData = Provider.of<Products>(
      context,
      listen: false,
    );

    Product product = productData.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
    );
  }
}
