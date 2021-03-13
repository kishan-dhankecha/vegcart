import 'package:flutter/material.dart';

import 'AppLogoName.dart';
import 'badge.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: AppLogoName(),
    actions: [
      Badge(
        child: IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
        value: '0',
      )
    ],
  );
}
