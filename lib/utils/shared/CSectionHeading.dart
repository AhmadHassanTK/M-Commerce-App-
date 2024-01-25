import 'package:flutter/material.dart';

class CSectionHeading extends StatelessWidget {
  const CSectionHeading({
    this.buttontitle = 'View all',
    required this.title,
    this.textcolor,
    this.onPressed,
    this.showactionbutton = true,
    super.key,
  });

  final Color? textcolor;
  final String title, buttontitle;
  final VoidCallback? onPressed;
  final bool showactionbutton;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textcolor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showactionbutton)
          TextButton(onPressed: onPressed, child: Text(buttontitle)),
      ],
    );
  }
}
