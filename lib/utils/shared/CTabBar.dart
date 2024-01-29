import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/device/device_utility.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          CHelperFunctions.isDarkMode(context) ? CColors.black : CColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: CColors.primary,
        labelColor: CHelperFunctions.isDarkMode(context)
            ? CColors.white
            : CColors.primary,
        unselectedLabelColor: CColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
