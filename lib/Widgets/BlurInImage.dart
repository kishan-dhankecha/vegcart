import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class BlurInImage extends StatelessWidget {
  final String url;
  final String blurHash;
  const BlurInImage(
    this.url, {
    this.blurHash,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Stack(
          children: [
            BlurHash(hash: blurHash),
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white38,
                ),
                strokeWidth: 1,
              ),
            ),
          ],
        );
      },
    );
  }
}
