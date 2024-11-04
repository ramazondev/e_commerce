import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:e_commerce/features/auth/presentation/pages/auth/widgets/w_elevated_button.dart';
import 'package:e_commerce/features/auth/presentation/pages/auth/widgets/w_outline_button.dart';
import 'package:e_commerce/features/auth/presentation/pages/widgets/w_rich_text.dart';
import 'package:e_commerce/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Center(child: AppIcons.logo.svg(height: 82, width: 82)),
            const Text(
              "Welcome to Lafyuu",
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Poppins',
                color: AppColors.textBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Sign in to continue",
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
            const SizedBox(height: 30),
             WElevatedButton(
              text: 'Sign in',
              onTap: (){
                context.goNamed(Routes.home);
              },
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.textFiled,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGreen,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.textFiled,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            WOutlinedButton(
              icon: AppIcons.google.svg(),
              text: 'Login with Google',
            ),
            const SizedBox(height: 12),
            WOutlinedButton(
              icon: AppIcons.facebook.svg(),
              text: 'Login with Facebook',
            ),
             // SizedBox(height: MediaQuery.of(context).size.height*0.3),
          ],
        ),
      ),
      floatingActionButton: WRichText(
        textForget: 'Forgot Password?\n',
        textAccount: 'Don’t have a account? ',
        textRegister: 'Register',
        onTap: () {
          context.go("/register");
        },
        onTapGo: () {
          context.go("/confirm-code");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
