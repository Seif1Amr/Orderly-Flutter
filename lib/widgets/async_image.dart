import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AsyncImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AsyncImage(this.src, {Key? key, this.width, this.height, this.fit = BoxFit.cover, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget img;
    if (src.startsWith('http')) {
      img = CachedNetworkImage(
        imageUrl: src,
        width: width,
        height: height,
        fit: fit,
        placeholder: (c, s) => Container(color: Colors.grey[200], width: width, height: height),
        errorWidget: (c, s, e) => Container(color: Colors.grey[300], width: width, height: height, child: const Icon(Icons.broken_image)),
      );
    } else {
      img = Image.asset(src, width: width, height: height, fit: fit);
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: img);
    }
    return img;
  }
}
