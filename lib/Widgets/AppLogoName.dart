import 'package:flutter/material.dart';

import '../constants.dart';

class AppLogoName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Veg',
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: kPrimaryColor,
              fontSize: 24,
            ),
        children: [
          TextSpan(
            text: 'Cart',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 24,
                ),
          ),
        ],
      ),
    );
  }
}
