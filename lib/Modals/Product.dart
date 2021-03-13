import 'package:flutter/foundation.dart';

class Product {
  final String id, title, description, imgUrl, blurHash;
  final double price, rating;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.blurHash,
    @required this.description,
    @required this.rating,
    @required this.price,
    this.isFavorite = false,
  });
}
