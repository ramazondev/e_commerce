import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../../../core/theme/app_icons.dart';
import '../auth/widgets/w_elevated_button.dart';
import '../widgets/w_rich_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: Column(
          children: [
            Center(child: AppIcons.logo.svg(height: 82, width: 82)),
            const Text(
              "Let’s Get Started",
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Poppins',
                color: AppColors.textBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Create an new account",
              style: TextStyle(
                color: AppColors.textGreen,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: AppColors.textGreen,
                ),
                hintText: 'Your Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFiled, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFiled, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFiled, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_outlined),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textFiled, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            WElevatedButton(
              text: 'Sign Up',
              onTap: () {},
            ),
            const SizedBox(height: 50),
            WRichText(
              textAccount: 'have a account? ',
              textRegister: 'Sign In',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
