import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegcart/Widgets/BlurInImage.dart';
import 'package:vegcart/Widgets/StarRating.dart';
import '../Provider/Products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    String productId = ModalRoute.of(context).settings.arguments as String;
    final productData = Provider.of<Products>(context, listen: false);
    Product product = productData.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: BlurInImage(
                product.imgUrl,
                blurHash: product.blurHash,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${product.title}',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 30,
                          ),
                    ),
                  ),
                  StarRating(rating: product.rating),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Description:',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              '${product.description}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    letterSpacing: 1.3,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
