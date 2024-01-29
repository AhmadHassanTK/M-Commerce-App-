import 'package:flutter/material.dart';
import 'package:shoes_app/utils/shared/CShoppingBagIcon.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/shared/CAppBar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: CColors.grey)),
          Text(CTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: CColors.white)),
        ],
      ),
      actions: [
        CShoppingCartIcon(
          iconcolor: CColors.white,
          onPressed: () {},
        )
      ],
    );
  }
}
