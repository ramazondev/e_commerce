import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Positioned.fill(
            child: Center(child: AppIcons.logoWhite.svg(width: 100,height: 100)),
          ),
        ],
      ),
    );
  }
}


