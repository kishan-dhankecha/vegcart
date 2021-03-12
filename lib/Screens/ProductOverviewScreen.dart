import 'package:flutter/material.dart';
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
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: DUMMY_PRODUCT_DATA.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 2,
              child: Column(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: Image.network(
                      DUMMY_PRODUCT_DATA[index].imgUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DUMMY_PRODUCT_DATA[index].title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            IconButton(
                              icon: Icon(
                                DUMMY_PRODUCT_DATA[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    DUMMY_PRODUCT_DATA[index].isFavorite =
                                        !DUMMY_PRODUCT_DATA[index].isFavorite;
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
