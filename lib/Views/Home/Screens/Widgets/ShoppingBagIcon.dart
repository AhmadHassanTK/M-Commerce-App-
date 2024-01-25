import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_app/utils/constants/colors.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon(
      {super.key, required this.iconcolor, required this.onPressed});

  final Color iconcolor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconcolor,
          ),
        ),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: CColors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: CColors.white),
            ),
          ),
        )
      ],
    );
  }
}
