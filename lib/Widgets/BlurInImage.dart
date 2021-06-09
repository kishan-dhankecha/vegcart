import 'package:flutter/material.dart';

class BlurInImage extends StatelessWidget {
  final String url;

  const BlurInImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
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
              Colors.white38,
            ),
            strokeWidth: 1,
          ),
        );
      },
    );
  }
}
