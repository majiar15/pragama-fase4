import 'package:flutter/material.dart';

class AvatarAtom extends StatelessWidget {
  final String imageUrl;
  final double size;

  const AvatarAtom({
    super.key,
    required this.imageUrl,
    this.size = 40.0
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
