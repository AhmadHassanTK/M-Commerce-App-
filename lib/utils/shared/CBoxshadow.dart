import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';

class CBoxShadow {
  static final verticalboxshadow = BoxShadow(
    color: CColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalboxshadow = BoxShadow(
    color: CColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
