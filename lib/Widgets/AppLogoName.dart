import 'package:flutter/material.dart';

import '../constants.dart';

class AppLogoName extends StatelessWidget {
  final firstName;
  final lastName;

  const AppLogoName({this.firstName = 'Veg', this.lastName = 'Cart'});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstName,
        style: Theme.of(context).textTheme.bodyText1.copyWith(color: kPrimaryColor, fontSize: 24),
        children: [
          TextSpan(
            text: lastName,
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).iconTheme.color, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
