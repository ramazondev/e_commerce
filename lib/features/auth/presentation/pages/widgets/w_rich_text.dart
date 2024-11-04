import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';

class WRichText extends StatelessWidget {
  final Function() onTap;
  final Function()? onTapGo;
  final String? textForget;
  final String textRegister;
  final String textAccount;

  const WRichText({
    super.key, required this.onTap, this.onTapGo, this.textForget, required this.textRegister, required this.textAccount,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontFamily: "Poppins",
          color: AppColors.textGreen,
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: textForget,
            style: const TextStyle(
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTapGo,
          ),
           TextSpan(
            text: textAccount,
          ),
          TextSpan(
            text: textRegister,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
