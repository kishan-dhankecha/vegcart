import 'package:flutter/material.dart';

import '../Screens/ProductDetailScreen.dart';
import '../DUMMY_DATA.dart';
import 'BlurInImage.dart';
import 'StarRating.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: DUMMY_DATA[index].id);
              },
              child: Container(
                height: 160,
                width: double.infinity,
                child: BlurInImage(
                  DUMMY_DATA[index].imgUrl,
                  blurHash: DUMMY_DATA[index].blurHash,
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DUMMY_DATA[index].title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      StarRating(rating: DUMMY_DATA[index].rating),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '₹${DUMMY_DATA[index].price}',
                          style: Theme.of(context).textTheme.headline6,
                          children: [
                            TextSpan(
                              text: '/kg.',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          DUMMY_DATA[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: DUMMY_DATA[index].isFavorite ? Theme.of(context).colorScheme.secondary : Theme.of(context).textTheme.bodyText1.color,
                        ),
                        onPressed: () {
                          //Toggle Favorite
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('ADD TO CART'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
