import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants/colors.dart';
import 'package:shoes_app/utils/constants/text_strings.dart';
import 'package:shoes_app/utils/helpers/helper_functions.dart';

class SignupTerms extends StatelessWidget {
  const SignupTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: '${CTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${CTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? CColors.white : CColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? CColors.white : CColors.primary,
                ),
          ),
          TextSpan(
            text: '${CTexts.and} ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: CTexts.termsOfUse,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? CColors.white : CColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? CColors.white : CColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
