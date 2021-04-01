import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Products.dart';
import '../Widgets/AppLogoName.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final urlPattern =
      r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  final testData = {
    'title': 'Test Product',
    'price': '52.45',
    'description': 'This is at least 10 characters long Description.',
    'imgUrl':
        'https://weilcollegeadvising.com/wp-content/uploads/test-intelligenza-sociale.jpg',
  };
  var _editedProduct = Product(
    id: null,
    title: '',
    imgUrl: '',
    blurHash: null,
    description: '',
    rating: 4,
    price: 0.0,
  );

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValidate = _formKey.currentState.validate();
    if (!isValidate) {
      return;
    }
    _formKey.currentState.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogoName(
          firstName: 'Add',
          lastName: 'Product',
        ),
        actions: [
          TextButton(
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              initialValue: kDebugMode ? testData['title'] : null,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value.isEmpty) return 'Please enter title!';
                return null;
              },
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (newValue) => _editedProduct = Product(
                id: _editedProduct.id,
                title: newValue,
                imgUrl: _editedProduct.imgUrl,
                blurHash: _editedProduct.blurHash,
                description: _editedProduct.description,
                rating: _editedProduct.rating,
                price: _editedProduct.price,
              ),
            ),
            TextFormField(
                focusNode: _priceFocusNode,
                initialValue: kDebugMode ? testData['price'] : null,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Please enter price!';
                  if (double.tryParse(value) == null)
                    return 'Please enter valid number!';
                  if (double.parse(value) <= 0)
                    return 'Please enter number greater than zero!';
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    imgUrl: _editedProduct.imgUrl,
                    blurHash: _editedProduct.blurHash,
                    description: _editedProduct.description,
                    rating: _editedProduct.rating,
                    price: double.parse(newValue),
                  );
                }),
            TextFormField(
              maxLines: 3,
              initialValue: kDebugMode ? testData['description'] : null,
              focusNode: _descriptionFocusNode,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) {
                if (value.isEmpty) return 'Please enter Description!';
                if (value.length < 10)
                  return 'Should be at least 10 characters long!';
                return null;
              },
              onSaved: (newValue) => _editedProduct = Product(
                id: _editedProduct.id,
                title: _editedProduct.title,
                imgUrl: _editedProduct.imgUrl,
                blurHash: _editedProduct.blurHash,
                description: newValue,
                rating: _editedProduct.rating,
                price: _editedProduct.price,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.url,
              initialValue: kDebugMode ? testData['imgUrl'] : null,
              decoration: InputDecoration(
                labelText: 'Image Url',
              ),
              validator: (value) {
                if (value.isEmpty) return 'Please enter Image Url!';
                var result = new RegExp(urlPattern, caseSensitive: false)
                    .firstMatch(value);
                if (result == null) return 'Please enter valid Image Url!';
                return null;
              },
              onFieldSubmitted: (_) => _saveForm(),
              onSaved: (newValue) => _editedProduct = Product(
                id: _editedProduct.id,
                title: _editedProduct.title,
                imgUrl: newValue,
                blurHash: _editedProduct.blurHash,
                description: _editedProduct.description,
                rating: _editedProduct.rating,
                price: _editedProduct.price,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
