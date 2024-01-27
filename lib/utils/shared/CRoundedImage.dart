// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

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
  });

  final double? height, width;
  final String imageurl;
  final bool roundedborder;
  final BoxFit boxFit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color backgroundcolor;
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
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageurl)
                : AssetImage(imageurl) as ImageProvider,
            fit: boxFit,
          ),
          borderRadius: roundedborder
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
        ),
      ),
    );
  }
}
