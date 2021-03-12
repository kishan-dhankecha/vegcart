import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  StarRating({this.starCount, this.rating});

  IconData getIcon(int index) {
    IconData icon;
    if (index >= rating) {
      icon = Icons.star_border_rounded;
    } else if (index > rating - 1 && index < rating) {
      icon = Icons.star_half_rounded;
    } else {
      icon = Icons.star_rounded;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount,
        (index) => Icon(getIcon(index)),
      ),
    );
  }
}
