import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';
import 'package:shoes_app/utils/shared/CRoundedContainer.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onselected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onselected;

  @override
  Widget build(BuildContext context) {
    final iscolor = CHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: iscolor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onselected,
        labelStyle: TextStyle(color: selected ? CColors.white : null),
        avatar: iscolor
            ? CRoundedContainer(
                width: 50,
                height: 50,
                backgroundcolor: CHelperFunctions.getColor(text)!,
              )
            : null,
        labelPadding: iscolor ? const EdgeInsets.all(0) : null,
        padding: iscolor ? const EdgeInsets.all(0) : null,
        shape: iscolor ? const CircleBorder() : null,
        backgroundColor: iscolor ? CHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
