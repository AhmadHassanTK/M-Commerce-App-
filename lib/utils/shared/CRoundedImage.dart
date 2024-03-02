// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';
import 'package:shoes_app/utils/shared/CShimmerEffect.dart';

class CRoundedImage extends StatelessWidget {
  const CRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageurl,
    this.backgroundcolor = CColors.light,
    this.padding,
    this.border,
    this.boxFit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.roundedborder = false,
    this.borderradius = CSizes.md,
    this.overlaycolor,
  });

  final double? height, width;
  final String imageurl;
  final bool roundedborder;
  final BoxFit boxFit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color backgroundcolor;
  final Color? overlaycolor;

  final BoxBorder? border;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: ClipRRect(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: boxFit,
                  imageUrl: imageurl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const CShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : imageurl != ''
                  ? Image(
                      image: AssetImage(imageurl),
                      fit: boxFit,
                      color: overlaycolor,
                    )
                  : null,
          borderRadius: roundedborder
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
        ),
      ),
    );
  }
}
