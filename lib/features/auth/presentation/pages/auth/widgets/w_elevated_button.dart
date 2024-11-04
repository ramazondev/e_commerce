import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_color.dart';

class WElevatedButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const WElevatedButton({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onTap,
      child:  Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
