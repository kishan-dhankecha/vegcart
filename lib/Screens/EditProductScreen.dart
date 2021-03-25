import 'package:flutter/material.dart';

import '../Widgets/AppLogoName.dart';

class EditProductScreen extends StatefulWidget {
  static const routeNAme = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(
          firstName: 'Add',
          lastName: 'Product',
        ),
      ),
      body: Container(),
    );
  }
}
