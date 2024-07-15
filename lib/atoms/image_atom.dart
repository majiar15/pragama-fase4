import 'package:flutter/material.dart';

class ImageAtom extends StatelessWidget {
  final String src;
  final BoxFit? fit;

  const ImageAtom({
    super.key,
    required this.src,
    this.fit
    });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Text('Failed to load image'),
        );
      },
    );
  }
}
