import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/color_config.dart';

class ImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final Color? color;
  final double? borderRadius;
  const ImageWidget({
    super.key,
    this.width = 32,
    this.height = 32,
    this.imageUrl,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        color: ColorConfig.darkGrey,
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
        image: imageUrl != null
            ? DecorationImage(
                image: CachedNetworkImageProvider(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
