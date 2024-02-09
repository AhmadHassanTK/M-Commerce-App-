import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/sizes.dart';

class CAnimationLoader extends StatelessWidget {
  const CAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actiontext,
    this.onActionPressed,
  });

  final String text, animation;
  final bool showAction;
  final String? actiontext;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: CSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: CColors.dark),
                    child: Text(
                      actiontext!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: CColors.light,
                          ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
