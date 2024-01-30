import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';

class CRoundedIcon extends StatelessWidget {
  const CRoundedIcon({
    super.key,
    this.width = 40,
    this.height = 40,
    this.backgroundColor = CColors.darkGrey,
    required this.icon,
    this.iconcolor = CColors.white,
  });

  final double? width, height;
  final Color? backgroundColor;
  final IconData icon;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: iconcolor,
          )),
    );
  }
}
