import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_color.dart';

class WOutlinedButton extends StatelessWidget {
  final String text;
  final Widget icon;

  const WOutlinedButton({

    super.key, required this.text, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.textFiled, width: 2),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.textGreen,
                fontSize: 14,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
