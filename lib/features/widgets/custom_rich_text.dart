import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';

class CustomRichText extends StatelessWidget {
  final Function()onTab;
  final String text;
  const CustomRichText({
    super.key, required this.onTab, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        recognizer: TapGestureRecognizer()..onTap = onTab,
      ),
    );
  }
}
